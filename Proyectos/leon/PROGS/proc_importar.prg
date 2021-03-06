*------------------------------------------
* FUNCION RecuperarID(lcAlias,lnSucursal)
*------------------------------------------
* Funcion para generar el id = sucursal + id.
* lcAlias = Nombre de la tabla
* lnSucursal = numero d ela sucursal.
*------------------------------------------
FUNCTION RecuperarID
PARAMETERS lcAlias, lnsucursal
lnsucursal = lnsucursal + 10 
lnid = 1
SELECT(lcAlias)
IF FSIZE('id')>4
	lntam = 10
ELSE 
   	lntam = 8
ENDIF 
IF RECCOUNT(lcAlias)>0
	GO BOTTOM 
	lnid = VAL(SUBSTR(STR(id,lntam+2),3)) +1
ENDIF 

lccadena = strzero(lnid,lntam)
RETURN INT(VAL(str(lnsucursal,2)+lccadena))


*------------------------------------------
* FUNCION ObtenerID(lcAlias,lnSucursal)
*------------------------------------------
* Funcion para generar el id = sucursal + id.
* lcAlias = Nombre de la tabla
* lnSucursal = numero d ela sucursal.
*------------------------------------------
FUNCTION ObtenerID
PARAMETERS lcAlias
TEXT TO lcCmdOb TEXTMERGE NOSHOW 
SELECT MAX(id) as max_id FROM <<lcAlias>> 
ENDTEXT 
IF NOT CrearCursorAdapter('CsrObtener',lcCmdOb)
	thisform.release 
	RETURN -1
ENDIF 
RETURN CsrObtener.max_id +1 


FUNCTION Ciudades
PARAMETERS lcLocalidad
LOCAL lcnombre
lcNombre = lclocalidad
lcLocalidad = STRTRAN(STRTRAN(STRTRAN(lcLocalidad," ",""),"-",""),".","")

DO CASE
CASE 'CONES' $ lcLocalidad
	lcnombre = 'GENERAL CONESA'
CASE 'ANTOMIO' $ lcLocalidad OR 'SANAOESTE' $ lcLocalidad
	lcnombre = 'SAN ANTONIO OESTE'
CASE '0ESTE' $ LcLocalidad OR lcLocalidad $ 'SANANTONIO' OR 'SAO' $ LcLocalidad
	lcnombre = 'SAN ANTONIO OESTE'	
CASE lcLocalidad $ 'PUERTODELESTE'
	lcnombre = 'SAN ANTONIO ESTE'
CASE "CONDOR" $ lcLocalidad
	lcnombre = 'BALNEARIO EL CONDOR'
CASE "BERNAL" $ lcLocalidad
	lcnombre = 'BERNAL'
CASE "PIEDRABUENA" $ lcLocalidad
	lcnombre = 'COMANDANTE LUIS PIEDRABUENA'
CASE "CERRI" $ lcLocalidad
	lcnombre = "GENERAL DANIEL CERRI"
CASE lcLocalidad  = "CNELDORREGO"
	lcnombre = "CORONEL DORREGO"
CASE "LAMERCED" $ lcLocalidad
	lcnombre = "COLONIA LA MERCED"
CASE "CORREA" $ lcLocalidad
	lcnombre = "CORREA"
CASE "FERREIRA" $ lcLocalidad
	lcnombre = "FERREYRA"
CASE "RODRIGUEZ" $ lcLocalidad
	lcnombre = "GENERAL RODRIGUEZ"
*!*	CASE lcLocalidad $ "PALTA-PUNTAALTA-PATA"
*!*		lcnombre = "PUNTA ALTA"
*!*	CASE 'PUNTAALTA' $ lcLocalidad
*!*		lcnombre = 'PUNTA ALTA'
CASE lcLocalidad$"BAHIABLANCA-BAHjABLANCA-BBLANCA-BAHABLANCA-BAHIABANCA-BBLNCA"
	lcnombre = "BAHIA BLANCA"
CASE 'BAHIABLANCA' $ lcLocalidad
	lcnombre = 'BAHIA BLANCA'
CASE lcLocalidad$"BUENOSAIRES-CABA-CADEBSAIRES-CAPFEDERAL-CAPITAL-CIUDADBUE-CAPITALFEDERAL-CDAUTONOMABSAIRES-BS-BSAS-CAPFEDE-CIUDADBS"
	lcnombre = "CIUDAD DE BUENOS AIRES"
CASE lcLocalidad$"LAPAMPA"
	lcnombre = "SANTA ROSA"
*!*	CASE lcLocalidad$"FLORES-"
*!*		lcnombre = "CIUDAD DE BUENOS AIRES"
*!*	CASE "CAPILLADELSE"$lcLocalidad
*!*		lcnombre = "CAPILLA DEL SE�OR"
*!*	CASE lcLocalidad$ "CIUDADELANORTE"
*!*		lcnombre = "CIUDADELA"
*!*	CASE "DADELANORTE" $ lcLocalidad
*!*		lcnombre = "CIUDADELA"
*!*	CASE "SAGUIER" $ lcLocalidad
*!*		lcnombre = "SANTA CLARA DE SAGUIER"
CASE "ECHEVE" $ lcLocalidad
	lcnombre = "BARRIO ESTEBAN ECHEVERRIA"
*!*	CASE "GALARZA" $ lcLocalidad
*!*		lcnombre = "GENERAL GALARZA"
*!*	CASE "CAMPOS" $ lcLocalidad
*!*		lcnombre = "GENERAL MANUEL CAMPOS"
*!*	CASE lcLocalidad $ "JOSELSUAREZ"
*!*		lcnombre = "JOSE LEON SUAREZ"
CASE "LANUS" $ lcLocalidad
	lcnombre = "LANUS"
*!*	CASE lcLocalidad $ "LAVALLOL"
*!*		lcnombre = "LLAVALLOL"
*!*	CASE "ZAMORA" $ lcLocalidad
*!*		lcnombre = "LOMAS DE ZAMORA"
*!*	CASE lcLocalidad $ "MARDELPLATA"
*!*		lcnombre = "MAR DEL PLATA"	
*!*	CASE "PAVON" $ lcLocalidad
*!*		lcnombre = "PAVON"
*!*	CASE lcLocalidad $ "PILAR"
*!*		lcnombre = "PILAR"
*!*	CASE "MEJIA" $ lcLocalidad
*!*		lcnombre = "RAMOS MEJIA"
*!*	CASE "REMECO" $ lcLocalidad
*!*		lcnombre = "REMECO (DPTO. GUATRACHE)"
*!*	CASE "JOSEDELAESQUINA" $ lcLocalidad
*!*		lcnombre = "SAN JOSE DE LA ESQUINA"
*!*	CASE lcLocalidad $ "ROSARIO"
*!*		lcnombre = "ROSARIO"
*!*	CASE lcLocalidad $ "ISABEL"
*!*		lcnombre = "BARRIO SANTA ISABEL"	
*!*	CASE "INSUPERABLE" $ lcLocalidad
*!*		lcnombre = "VILLA INSUPERABLE"
*!*	CASE lcLocalidad $ "VRETIRO"
*!*		lcnombre = "BUEN RETIRO"
CASE "GDORGALVEZ" $ lcLocalidad
	lcnombre = "GALVEZ"
*!*	CASE "GOBGALVEZ" $ lcLocalidad
*!*		lcnombre = "VILLA GOBERNADOR GALVEZ"
*!*	CASE lcLocalidad $ "VTELOPEZ"
*!*		lcnombre = "VICENTE LOPEZ"
CASE "CHAVES" $ lcLocalidad
	lcnombre = "GONZALEZ CHAVES"
*!*	CASE '(RN)ALROCA' $ lcLocalidad
*!*		lcnombre = "GENERAL ROCA"
*!*	CASE 'CABILDO' $ lcLocalidad
*!*		lcnombre = 	'CABILDO'                       
CASE lcLocalidad $ 'CALETAOLIVIA'
	lcnombre = 'CALETA OLIVIA'
*!*	CASE 'AGONZALEZCHAVE' $ lcLocalidad
*!*		lcnombre = 'ADOLFO GONZALES CHAVES'
*!*	CASE 'ALLEN' $ lcLocalidad
*!*		lcnombre = 'ALLEN'
*!*	CASE 'ALPACHIRI' $ lcLocalidad
*!*		lcnombre = 'ALPACHIRI'	
*!*	CASE 'BOLIVAR' $ lcLocalidad
*!*		lcnombre = 'BOLIVAR' 
CASE 'PATAGONES' $ lcLocalidad
	lcnombre = 'CARMEN DE PATAGONES'
CASE 'PARERA' $ lcLocalidad
	lcnombre = 'PARERA'
*!*	CASE 'CRIVADAVIA' $ lcLocalidad
*!*		lcnombre = 'COMODORO RIVADAVIA'
*!*	CASE 'SUAREZ' $ lcLocalidad
*!*		lcnombre = 'CORONEL SUAREZ' 
*!*	CASE 'CALAFATE' $ lcLocalidad
*!*		lcnombre = 'CALAFATE'
*!*	CASE 'CHICHINALES' $ lcLocalidad
*!*		lcnombre = 'CHICHINALES'
*!*	CASE 'CHINCHINALES' $ lcLocalidad
*!*		lcnombre = 'CHICHINALES'
*!*	CASE 'CHIMPAY' $ lcLocalidad
*!*		lcnombre = 'CHIMPAY' 
*!*	CASE 'CHOELE' $ lcLocalidad
*!*		lcnombre = 'CHOELE CHOEL'
*!*	CASE 'CHOLILA' $ lcLocalidad
*!*		lcnombre = 'CHOLILA' 
*!*	CASE 'CINCO SALTOS' $ lcLocalidad
*!*		lcnombre = 'CINCO SALTOS'
*!*	CASE 'CIPOLLETTI' $ lcLocalidad
*!*		lcnombre = 'CIPOLLETTI'
*!*	CASE 'ECHARREN' $ lcLocalidad
*!*		lcnombre = 'COLONIA JULIA Y ECHARREN'
*!*	CASE 'DORRE' $ lcLocalidad
*!*		lcnombre = 'CORONEL DORREGO' 
*!*	CASE 'PRINGLES' $ lcLocalidad
*!*		lcnombre = 'CORONEL PRINGLES' 
*!*	CASE 'BELISLE' $ lcLocalidad
*!*		lcnombre = 'CORONEL BELISLE'
*!*	CASE '17DEAGOSTO' $ lcLocalidad
*!*		lcnombre = 'DIECISIETE DE AGOSTO'
*!*	CASE 'ELBOLSON' $ lcLocalidad
*!*		lcnombre = 'EL BOLSON'
*!*	CASE 'ELCUY' $ lcLocalidad
*!*		lcnombre = 'EL CUY'
*!*	CASE 'ESPASTILLAR' $ lcLocalidad
*!*		lcnombre = 'ESPASTILLAR (PDO. SAAVEDRA)'
*!*	CASE 'ESQUEL' $ lcLocalidad
*!*		lcnombre = 'ESQUEL'
*!*	CASE 'ACHA' $ lcLocalidad
*!*		lcnombre = 'GENERAAL ACHA'
*!*	CASE 'CERRI' $ lcLocalidad
*!*		lcnombre = 'GENERAL DANIEL CERRI'
*!*	CASE 'GODOY' $ lcLocalidad
*!*		lcnombre = 'GENERAL ENRIQUE GODOY'
*!*	CASE 'LAMADRID' $ lcLocalidad
*!*		lcnombre = 'GENERAL LA MADRID'
*!*	CASE 'GRALROCA' $ lcLocalidad
*!*		lcnombre = 'GENERAL ROCA'
*!*	CASE 'GRALSANMARTIN' $ lcLocalidad
*!*		lcnombre = 'GENERAL SAN MARTIN'
*!*	CASE 'GDORCOSTA' $ lcLocalidad
*!*		lcnombre = 'GOBERNADOR COSTA'
*!*	CASE 'GUAMINI' $ lcLocalidad
*!*		lcnombre = 'GUAMINI'
*!*	CASE 'GUATRACHE' $ lcLocalidad
*!*		lcnombre = 'GUATRACHE'
CASE 'ASCASUBI' $ lcLocalidad
	lcnombre = 'HILARIO ASCASUBI'
*!*	CASE 'ELHOYO' $ lcLocalidad
*!*		lcnombre = 'HOYO DE EPUYEN'
*!*	CASE 'HUANGUELEN' $ lcLocalidad
*!*		lcnombre = 'HUANGUELEN'
*!*	CASE 'HUERGO' $ lcLocalidad
*!*		lcnombre = 'INGENIERO HUERGO'
*!*	CASE 'WHITE' $ lcLocalidad
*!*		lcnombre = 'INGENIERO WHITE'
*!*	CASE 'GUISASOLA' $ lcLocalidad
*!*		lcnombre = 'JOSE A. GUISASOLA'
*!*	CASE 'JDESMARTIN' $ lcLocalidad
*!*		lcnombre = 'JOSE DE SAN MARTIN'
*!*	CASE 'JNFERNANDEZ' $ lcLocalidad
*!*		lcnombre = 'JUAN N. FERNANDEZ'
*!*	CASE 'LAADELA' $ lcLocalidad
*!*		lcnombre = 'LA ADELA'
*!*	CASE 'LAMARQUE' $ lcLocalidad
*!*		lcnombre = 'LAMARQUE'
CASE 'LASGRUTAS' $ lcLocalidad
	lcnombre = 'LAS GRUTAS'
*!*	CASE 'LASHERAS' $ lcLocalidad
*!*		lcnombre = 'LAS HERAS'
*!*	CASE 'LELEQUE' $ lcLocalidad
*!*		lcnombre = 'LELEQUE'
*!*	CASE 'LIBANO' $ lcLocalidad
*!*		lcnombre = 'LIBANO'
*!*	CASE 'LOSMENUCOS' $ lcLocalidad
*!*		lcnombre = 'LOS MENUCOS'
*!*	CASE 'LUISBELTRAN' $ lcLocalidad
*!*		lcnombre = 'LUIS BELTRAN'
*!*	CASE 'MACACHIN' $ lcLocalidad
*!*		lcnombre = 'MACACHIN'
*!*	CASE 'MAQUINCAHO' $ lcLocalidad
*!*		lcnombre = 'MAQUINCHAO'
CASE 'BURATOVICH' $ lcLocalidad
	lcnombre = 'MAYOR BURATOVICH'
*!*	CASE 'CASCALLARES' $ lcLocalidad
*!*		lcnombre = 'MICAELA CASCALLARES'
*!*	CASE 'RIGLOS' $ lcLocalidad
*!*		lcnombre = 'MIGUEL RIGLOS'
*!*	CASE 'STEFANELLI' $ lcLocalidad
*!*		lcnombre = 'PADRE ALEJANDRO STEFENELLI'
*!*	CASE 'PLOTTIER' $ lcLocalidad
*!*		lcnombre = 'PLOTTIER'
*!*	CASE 'PUAN' $ lcLocalidad
*!*		lcnombre = 'PUAN'
CASE 'MADRYN' $ lcLocalidad
	lcnombre = 'PUERTO MADRYN'
CASE 'SANCARLOS' $ lcLocalidad
	lcnombre = 'SAN CARLOS CENTRO'
CASE 'STROEDER' $ lcLocalidad
	lcnombre = 'EMPORIO STROEDER'
*!*	CASE 'SJULIA' $ lcLocalidad
*!*		lcnombre = 'PUERTO SAN JULIA'
*!*	CASE 'PTOSTACRUZ' $ lcLocalidad
*!*		lcnombre = 'PUERTO SANTA CRUZ'
*!*	CASE 'QUEMU QUEMU' $ lcLocalidad
*!*		lcnombre = 'QUEMU QUEMU'
*!*	CASE 'QUINIHUAL' $ lcLocalidad
*!*		lcnombre = 'QUI�IHUAL'
*!*	CASE 'COLORADO' $ lcLocalidad
*!*		lcnombre = 'RIO COLORADO'
*!*	CASE 'GALLEGOS' $ lcLocalidad
*!*		lcnombre = 'RIO GALLEGOS'
*!*	CASE 'RIOMAYO' $ lcLocalidad
*!*		lcnombre = 'RIO MAYO'
*!*	CASE 'RIOTURBIO' $ lcLocalidad
*!*		lcnombre = 'RIO TURBIO'
*!*	CASE 'SALLIQUELO' $ lcLocalidad
*!*		lcnombre = 'SALLIQUELO'
*!*	CASE 'BARILOCHE' $ lcLocalidad
*!*		lcnombre = 'SAN CARLOS DE BARILOCHE'
*!*	CASE 'SANCAYETANO' $ lcLocalidad
*!*		lcnombre = 'SAN CAYETANO'
*!*	CASE 'BELLOCQ' $ lcLocalidad
*!*		lcnombre = 'SAN FRANCISCO DE BELLOCQ'
*!*	CASE 'SANTAROSA' $ lcLocalidad
*!*		lcnombre = 'SANTA ROSA'
*!*	CASE 'SARMIENTO' $ lcLocalidad
*!*		lcnombre = 'SARMIENTO'
*!*	CASE 'SANPDELCHA' $ lcLocalidad
*!*		lcnombre = 'SAN PATRICIO DEL CHA�AR'
*!*	CASE 'TANDIL' $ lcLocalidad
*!*		lcnombre = 'TANDIL'
*!*	CASE 'TAPIALES' $ lcLocalidad
*!*		lcnombre = 'TAPIALES'
*!*	CASE 'TECKA' $ lcLocalidad
*!*		lcnombre = 'TECKA'
*!*	CASE 'TOAY' $ lcLocalidad
*!*		lcnombre = 'TOAY'
*!*	CASE 'ARROYOS' $ lcLocalidad
*!*		lcnombre = 'TRES ARROYOS'
*!*	CASE 'TREVELIN' $ lcLocalidad
*!*		lcnombre = 'TREVELIN'
CASE 'VIEDMA' $ lcLocalidad OR 'VIEMA' $ lcLocalidad
	lcnombre = 'VIEDMA'
*!*	CASE 'ANGOSTURA' $ lcLocalidad
*!*		lcnombre = 'VILLA LA ANGOSTURA'
*!*	CASE 'VILLALONGA' $ lcLocalidad
*!*		lcnombre = 'VILLA LONGA'
*!*	CASE 'VILLAMANZANO' $ lcLocalidad
*!*		lcnombre = 'VILLA MANZANO'
*!*	CASE 'VILLAREGINA' $ lcLocalidad
*!*		lcnombre = 'VILLA REGINA'
*!*	CASE 'SANVICENTE' $ lcLocalidad
*!*		lcnombre = 'BARRIO SAN VICENTE'
*!*	CASE 'COSQ' $ lcLocalidad
*!*		lcnombre = 'COSQUIN'
*!*	CASE 'FERREYRA' $ lcLocalidad
*!*		lcnombre = 'FERREYRA (DPTO. CAPITAL)'
*!*	CASE 'HAEDONO' $ lcLocalidad
*!*		lcnombre = 'HAEDO'
*!*	CASE 'ISIDROCASA' $ lcLocalidad
*!*		lcnombre = 'ISIDRO CASANOVA'
*!*	CASE 'LDELMIRADOR' $ lcLocalidad
*!*		lcnombre = 'LOMAS DEL MIRADOR'
*!*	CASE 'LAREJA' $ lcLocalidad
*!*		lcnombre = 'LA REJA'
*!*	CASE 'LA TABLADA' $ lcLocalidad
*!*		lcnombre = 'TABLADA'
*!*	CASE 'LANUS' $ lcLocalidad
*!*		lcnombre = 'LANUS'
*!*	CASE 'LOMAHERMOSA' $ lcLocalidad
*!*		lcnombre = 'VILLA LOMA HERMOSA'
*!*	CASE 'LOMAVERDE' $ lcLocalidad
*!*		lcnombre = 'BARRIO LOMA VERDE'
*!*	CASE 'PIGUE' $ lcLocalidad
*!*		lcnombre = 'PIGUE'
*!*	CASE 'EYRO' $ lcLocalidad
*!*		lcnombre = 'PI�EYRO (PDO. AVELLANEDA)'
*!*	CASE 'RDEESCALADA' $ lcLocalidad
*!*		lcnombre = 'REMEDIOS DE ESCALADA'
*!*	CASE 'TOAY' $ lcLocalidad
*!*		lcnombre = 'TOAY'
*!*	CASE 'VBALLESTER' $ lcLocalidad
*!*		lcnombre = 'VILLA BALLESTER'
*!*	CASE 'VMAIPU' $ lcLocalidad
*!*		lcnombre = 'VILLA MAIPU'				
*!*						
*!*	CASE '' $ lcLocalidad
*!*		lcnombre = ''

ENDCASE

RETURN lcNombre
