PARAMETERS ldvacio,lcpath,lcBase
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcData = lcBase

DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

Oavisar.proceso('S','Abriendo archivos') 
llok = .t.
llok = CargarTabla(lcData,'Ctacte',.t.)
llok = CargarTabla(lcData,'TipoIva')
*llok = CargarTabla(lcData,'CateCtacte',.t.)
llok = CargarTabla(lcData,'Barrio',.t.)
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Sucursal',.t.)

TEXT TO lcCmd TEXTMERGE NOSHOW 
SELECT CsrLocalidad.* FROM Localidad as CsrLocalidad
ENDTEXT 
=CrearCursorAdapter('CsrLocalidad',lcCmd)

SET SAFETY ON
CREATE CURSOR CsrLista (deta01 c(250),deta02 c(250),deta03 c(250) )
CREATE CURSOR CsrDeudor (Codigo c(8),Categoria c(20),Nombre c(70),Direccion c(100),Localidad c(50),CodPostal c(10),Provincia c(50);
		,Telefono c(20),Telefono2 c(20),Fax c(20),Celular c(20),Email c(50),fecAlta c(15),TipoDoc c(50),Documento c(20);
		,TipoIVA c(50),Vendedor c(30),Zona c(3),obsercli c(100),ctadeudor n(1),IngBrutos c(20);
		,DireNro c(5),DirePiso c(5),DireDpto c(5),Lista c(30),CodLista n(2),Estado c(1);
		,CodCateIVA n(2),CodGan n(3),cPlanPago n(1),cDiasVto n(3))

		
Oavisar.proceso('S','Abriendo archivos') 

*!*	SELECT CsrLista
*!*	cArchivo = ADDBS(ALLTRIM(lcpath ))+"clientes.csv"
*!*	APPEND FROM  &cArchivo SDF

*!*	lcDelimitador = ";"
*!*	replace ALL deta01 WITH STRTRAN(deta01,"	",lcDelimitador)
*!*	replace ALL deta02 WITH STRTRAN(deta02,"	",lcDelimitador)
*!*	replace ALL deta03 WITH STRTRAN(deta03,"	",lcDelimitador)

*!*	Oavisar.proceso('S','Procesando '+alias()) 

*!*	cCadeCtacte = "" 


*!*	SELECT CsrLista
*!*	GO TOP 
*!*	*vista()
*!*	lnPrimeraOcurrencia = 1
*!*	leiunarticulo = .f.

*!*	ldebug = .t.

*!*	SKIP 
*!*	DO WHILE NOT EOF()
*!*		lnCantCampo = 22 &&Hay un campo vacio
*!*		lnSiguienteOcurrencia = 1
*!*		lnCamposLeidos = 1 &&Campos de CsrLista
*!*		lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)

*!*		IF AT(lcDelimitador,deta01)=1 AND (AT(lcDelimitador,deta01,2)=AT(lcDelimitador,deta01)+1 OR AT(lcDelimitador,deta01,3)=AT(lcDelimitador,deta01,2)+1)
*!*			LOOP 
*!*		ENDIF 
*!*		
*!*		IF AT(lcDelimitador,deta01)=lnPrimeraOcurrencia
*!*			leiunarticulo = .t.
*!*			STORE "" TO lcAcarreo
*!*			STORE "" TO lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia
*!*			STORE "" TO lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento
*!*			STORE "" TO lcTipoIVA,lcVendedor,lcZona,lcCodVendedor,lcDireNro,lcDirePiso,lcDireDpto,lcLista
*!*			STORE "" TO lcEstado,lcCodLista,lcCodCateIVA
*!*			
*!*			j = 0
*!*		ELSE
*!*			IF !leiunarticulo
*!*				LOOP 
*!*			ENDIF 
*!*		ENDIF 
*!*		
*!*		DO WHILE lnCamposLeidos<4
*!*			i = 1
*!*			DO WHILE i + j <= lnCantCampo &&Campos de CsrArti + 1
*!*				lnpos = AT(lcDelimitador,&lcNomCampo,i)
*!*				IF lnPos#0 &&No es fin de linea
*!*					lccadena = ALLTRIM(lcAcarreo) + SUBSTR(&lcNomCampo,lnSiguienteOcurrencia,lnpos-(lnSiguienteOcurrencia))
*!*					lcAcarreo = ""
*!*				ELSE 
*!*					lcAcarreo = ALLTRIM(lcAcarreo) + ALLTRIM(SUBSTR(&lcNomCampo,lnSiguienteOcurrencia))
*!*					EXIT 
*!*				ENDIF
*!*				lcCodigo		= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcCodigo)))
*!*				lcNombre		= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcNombre)))
*!*				lcDocumento		= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcDocumento)))
*!*				lcDireccion		= UPPER(LimpiarCadena(IIF(j + i=5,lcCadena,lcDireccion)))
*!*				lcDireNro		= UPPER(LimpiarCadena(IIF(j + i=6,lcCadena,lcDireNro)))
*!*				lcDirePiso		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcDirePiso)))
*!*				lcDireDpto		= UPPER(LimpiarCadena(IIF(j + i=8,lcCadena,lcDireDpto)))
*!*				LcLocalidad		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcLocalidad)))
*!*				lcProvincia		= UPPER(LimpiarCadena(IIF(j + i=11,lcCadena,lcProvincia)))
*!*				lcTelefono		= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcTelefono)))
*!*				lcCodCateIVA	= UPPER(LimpiarCadena(IIF(j + i=13,lcCadena,lcCodCateIVA)))
*!*				lcTipoIVA		= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcTipoIVA)))
*!*				*lcCategoria	= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcCategoria)))
*!*				lcTelefono2		= UPPER(LimpiarCadena(IIF(j + i=15,lcCadena,lcTelefono2)))
*!*				lcEstado		= UPPER(LimpiarCadena(IIF(j + i=16,lcCadena,lcEstado)))
*!*				lcCodLista			= UPPER(LimpiarCadena(IIF(j + i=17,lcCadena,lcCodLista)))
*!*				lcLista			= UPPER(LimpiarCadena(IIF(j + i=18,lcCadena,lcLista)))
*!*				lcCodVendedor	= UPPER(LimpiarCadena(IIF(j + i=21,lcCadena,lcCodVendedor)))
*!*				lcVendedor		= UPPER(LimpiarCadena(IIF(j + i=22,lcCadena,lcVendedor)))
*!*				
*!*				*lcCodPostal		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcCodPostal)))
*!*				*lcFax			= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcFax)))
*!*				*lcCelular		= UPPER(LimpiarCadena(IIF(j + i=13,lcCadena,lcCelular)))
*!*				*lcEmail			= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcEmail)))
*!*				*lcfecAlta		= IIF(j + i=19,lcCadena,lcFecAlta)
*!*				lcTipoDoc		= 'CUIT'&&UPPER(LimpiarCadena(IIF(j + i=22,lcCadena,lcTipoDoc)))
*!*				*lcZona			= UPPER(LimpiarCadena(IIF(j + i=29,lcCadena,lcZona)))
*!*								
*!*				lnSiguienteOcurrencia = lnPos + 1
*!*				i = i + 1
*!*				
*!*				IF VAL(lcCodigo)=1772 and ldebug
*!*					*stop()
*!*					ldebug = .f.
*!*				ENDIF 
*!*			
*!*			ENDDO 
*!*			lnSiguienteOcurrencia = 1
*!*			lnCamposLeidos = lnCamposLeidos + 1
*!*			lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)
*!*			IF lnPos = 0 AND i <= lnCantCampo &&Si no termino, y no es un campo csrati q nop existe
*!*				 j = j + (i - 1)
*!*			ENDIF 
*!*			IF lnpos#0 AND i+j >= lnCantCampo
*!*				EXIT 
*!*			ENDIF 
*!*		ENDDO 

*!*		IF lnpos#0 AND i+j >= lnCantCampo
*!*			&&Insertamos si se encontro una ultima ocurrencia con respecto a la cantidad de registros
*!*			&&Que se grabaran en csrarti.
*!*			&&Esta dise�ado para leer hasta los precios.
*!*			&&Si se quiere leer todo. Se necesita un caracter de finalizado de linea.
*!*			
*!*			IF ASC(LEFT(lcNombre,1))=149 OR ASC(LEFT(lcNombre,1))=149 OR lentrim(lcNombre)=0 OR LEFT(lcNombre,3)='---'
*!*				LOOP 
*!*			ENDIF 
*!*			
*!*			
*!*			INSERT INTO CsrDeudor (Codigo,Categoria,Nombre,Direccion,Localidad,CodPostal,Provincia;
*!*			,Telefono,Telefono2,Fax,Celular,Email,fecAlta,TipoDoc,Documento;
*!*			,TipoIVA,Vendedor,Zona,ctadeudor,DireNro,DirePiso,DireDpto,Lista,Estado,CodLista;
*!*			,CodCateIVA) ;
*!*			values (lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia ;
*!*			,lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento ;
*!*			,lcTipoIVA,lcVendedor,lcZona,1,lcDireNro,lcDirePiso,lcDireDpto,lcLista,lcEstado;
*!*			,VAL(lcCodLista))
*!*					
*!*			*replace descripcion WITH lmDescripcion IN FsrArticulo
*!*			leiunarticulo = .f.
*!*		ENDIF 
*!*		SKIP IN CsrLista
*!*	ENDDO 

&&Eliminamos los cliente del vendedor 5
*DELETE FROM CsrDeudor WHERE VAL(vendedor) = 5

SET SAFETY OFF 
SELECT CsrLista
ZAP 
SET SAFETY ON 
cArchivo = ALLTRIM(lcpath )+"\proveedores.csv"
APPEND FROM  &cArchivo SDF

lcDelimitador = ";"
replace ALL deta01 WITH STRTRAN(deta01,"	",lcDelimitador)
replace ALL deta02 WITH STRTRAN(deta02,"	",lcDelimitador)
replace ALL deta03 WITH STRTRAN(deta03,"	",lcDelimitador)


SELECT CsrLista
GO TOP 
*vista()
lnPrimeraOcurrencia = 1
leiunarticulo = .f.
*STOP()
SKIP 

DO WHILE NOT EOF() 
	lnCantCampo = 27 &&Hay un campo vacio
	lnSiguienteOcurrencia = 1
	lnCamposLeidos = 1 &&Campos de CsrLista
	lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)

	IF AT(lcDelimitador,deta01)=1 AND (AT(lcDelimitador,deta01,2)=AT(lcDelimitador,deta01)+1 OR AT(lcDelimitador,deta01,3)=AT(lcDelimitador,deta01,2)+1)
		LOOP 
	ENDIF 
	
	IF AT(lcDelimitador,deta01)=lnPrimeraOcurrencia
		leiunarticulo = .t.
		STORE "" TO lcAcarreo
		STORE "" TO lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia
		STORE "" TO lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento
		STORE "" TO lcobservacion,lcIngBrutos
		STORE "" TO lcTipoIVA,lcVendedor,lcZona,lcCodVendedor,lcDireNro,lcDirePiso,lcDireDpto,lcLista
		STORE "" TO lcEstado,lcCodLista,lcCodCateIVA,lcCodGan,lcPlanPago,lcDiasVto
		
		j = 0
	ELSE
		IF !leiunarticulo
			LOOP 
		ENDIF 
	ENDIF 
	
	DO WHILE lnCamposLeidos<4
		i = 1
		DO WHILE i + j <= lnCantCampo &&Campos de CsrArti + 1
			lnpos = AT(lcDelimitador,&lcNomCampo,i)
			IF lnPos#0 &&No es fin de linea
				lccadena = ALLTRIM(lcAcarreo) + SUBSTR(&lcNomCampo,lnSiguienteOcurrencia,lnpos-(lnSiguienteOcurrencia))
				lcAcarreo = ""
			ELSE 
				lcAcarreo = ALLTRIM(lcAcarreo) + ALLTRIM(SUBSTR(&lcNomCampo,lnSiguienteOcurrencia))
				EXIT 
			ENDIF
			lcCodigo		= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcCodigo)))
			lcNombre		= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcNombre)))
			
			lcDireccion		= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcDireccion)))
			lcDireNro		= UPPER(LimpiarCadena(IIF(j + i=5,lcCadena,lcDireNro)))
			lcDirePiso		= UPPER(LimpiarCadena(IIF(j + i=6,lcCadena,lcDirePiso)))
			lcDireDpto		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcDireDpto)))
			LcLocalidad		= UPPER(LimpiarCadena(IIF(j + i=9,lcCadena,lcLocalidad)))
			lcProvincia		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcProvincia)))
			lcTelefono		= UPPER(LimpiarCadena(IIF(j + i=11,lcCadena,lcTelefono)))			
			lcCodCateIVA	= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcCodCateIVA)))
			lcTipoIVA		= UPPER(LimpiarCadena(IIF(j + i=13,lcCadena,lcTipoIVA)))
			lcIngBrutos		= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcIngBrutos)))
			lcDocumento		= UPPER(LimpiarCadena(IIF(j + i=15,lcCadena,lcDocumento)))
			
			lcCBU			= UPPER(LimpiarCadena(IIF(j + i=20,lcCadena,lcCBU)))
			lcTelefono2		= UPPER(LimpiarCadena(IIF(j + i=21,lcCadena,lcTelefono2)))
			lcCodGan		= UPPER(LimpiarCadena(IIF(j + i=25,lcCadena,lcCodGan)))
			lcPlanPago		= UPPER(LimpiarCadena(IIF(j + i=26,lcCadena,lcPlanPago)))
			lcDiasVto		= UPPER(LimpiarCadena(IIF(j + i=27,lcCadena,lcDiasVto)))
										
			lnSiguienteOcurrencia = lnPos + 1
			i = i + 1
		ENDDO 
		lnSiguienteOcurrencia = 1
		lnCamposLeidos = lnCamposLeidos + 1
		lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)
		IF lnPos = 0 AND i <= lnCantCampo &&Si no termino, y no es un campo csrati q nop existe
			 j = j + (i - 1)
		ENDIF 
		IF lnpos#0 AND i+j >= lnCantCampo
			EXIT 
		ENDIF 
	ENDDO 

	IF lnpos#0 AND i+j >= lnCantCampo
		&&Insertamos si se encontro una ultima ocurrencia con respecto a la cantidad de registros
		&&Que se grabaran en csrarti.
		&&Esta dise�ado para leer hasta los precios.
		&&Si se quiere leer todo. Se necesita un caracter de finalizado de linea.
		
		IF ASC(LEFT(lcNombre,1))=149 OR ASC(LEFT(lcNombre,1))=149 OR lentrim(lcNombre)=0 OR LEFT(lcNombre,3)='---'
			LOOP 
		ENDIF 
		
		
		INSERT INTO CsrDeudor (Codigo,Categoria,Nombre,Direccion,Localidad,CodPostal,Provincia;
		,Telefono,Telefono2,Fax,Celular,Email,fecAlta,TipoDoc,Documento;
		,TipoIVA,Vendedor,Zona,ctadeudor,DireNro,DirePiso,DireDpto,Lista,Estado,CodLista;
		,CodCateIVA,CodGan,PlanPago,DiasVto) ;
		values (lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia ;
		,lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento ;
		,lcTipoIVA,"","",0,lcDireNro,lcDirePiso,lcDireDpto,"",lcEstado;
		,0,VAL(lcCodCateIVA),VAL(lcCodGan),VAL(lcPlanPago),VAL(lcDiasVto))
				
		*replace descripcion WITH lmDescripcion IN FsrArticulo
		leiunarticulo = .f.
	ENDIF 
	SKIP 
ENDDO 


SELECT distinct UPPER(localidad) as nombre ,SPACE(30) AS Localidad FROM CsrDeudor  INTO CURSOR CsrCiudad READWRITE 

SELECT CsrCiudad
SCAN 
	lcLocalidadBuscada = Ciudades(ALLTRIM(UPPER(nombre)))
	SELECT CsrLocalidad
	LOCATE FOR nombre = lcLocalidadBuscada
	IF id#0
		replace localidad WITH lcLocalidadBuscada IN CsrCiudad
	ENDIF 
	SELECT CsrCiudad
ENDSCAN
*vista()

*!*	lnid = RecuperarID('CsrCatectacte',Goapp.sucursal10)
*!*	lnnumero = 1
*!*	SELECT distinct UPPER(Categoria) as nombre FROM CsrDeudor  INTO CURSOR CsrCategoria

*!*	SELECT CsrCategoria
*!*	GO top
*!*	SCAN 
*!*		INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,CsrCategoria.nombre,0,0,0,'00000')
*!*		lnid = lnid +1 
*!*		lnnumero = lnnumero + 1 
*!*	ENDSCAN 

*!*	lnidmercaderia = lnid
*!*	INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'PROVEEDOR',0,0,0,'01000')
*!*	lnid = lnid +1 
*!*	lnnumero = lnnumero + 1 
*!*	INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'SERVICIO',0,0,0,'00000')

lnid = RecuperarID('CsrCtacte',Goapp.sucursal10)

SELECT distinct UPPER(lista) as nombre FROM CsrDeudor INTO CURSOR CsrListaPrecio
SELECT CsrListaPrecio

SELECT CsrDeudor
Oavisar.proceso('S','Procesando '+alias()) 
GO TOP

*stop()
SCAN 
	
	IF VAL(codigo)=1772
		*stop()
	ENDIF 
	
 	SELECT CsrCtacte
 	LOCATE FOR VAL(cnumero) = VAL(CsrDeudor.codigo) AND CsrDeudor.ctadeudor = 1
 	IF VAL(cnumero) = VAL(CsrDeudor.codigo) AND CsrDeudor.ctadeudor = 1
 		cCadeCtacte = LTRIM(cCadeCtacte) + IIF(LEN(LTRIM(cCadeCtacte)) != 0,",","") + ltrim(CsrDeudor.codigo)
 		SELECT CsrDeudor
 		LOOP 
 		
 	ENDIF 
 	SELECT CsrDeudor 
 	STORE 0 TO lnidestado, 	lnctadeudor ,	lnctaacreedor, 	lnctabanco,	lnctaotro, 	lndctalogistica;
 			,lnidcateibrng ,lncomision ,lnidlocalidad ,lnidprovincia ,lntipoiva ,lnidcategoria;
			,lnidplanpago ,lnidcanalvta ,lnsaldoAuto ,lnlista ,lncomision ,lnconvenio,lndctalogistica;
			,lnbonif1
	
 	STORE 1100000001 TO lnidbarrio, lnidcategoria, lnlista
 	STORE "" TO lcCuit,lcDNI,lcingbrutos,lcingbrutosBA,lcdatosfac,lcOtro01,lcObserva
 	STORE DATETIME(1900,01,01,0,0,0) TO ldfechac,ldfecultcompra,ldfecultpago,lcfefin
 		
 	lnctadeudor		= 1
 	lnidplanpago	= 1100000001 &&Por el momento todos de cuenta corriente		
	lnidcanalvta	= 1
	lnlista			= CsrDeudor.CodLista
	DO CASE
	CASE lnLista = 0
		lnLista = 1
	OTHERWISE
		&&Falta el resto de listas que nose cuales seran las por defecto
	ENDCASE
		
	lcNroDoc		= strtrim(VAL(PeloCuit(CsrDeudor.Documento)),15)
	
	IF ALLTRIM(CsrDeudor.tipodoc)$'CUIT'
		lcCuit			= Cuit(lcNroDoc)
	ENDIF 
	
	&&Localidad
	lnidlocalidad	= 1100000345  &&Bahia Blanca
	lcLocalidadBuscada = Ciudades(ALLTRIM(UPPER(CsrDeudor.Localidad)))
	SELECT CsrLocalidad
	LOCATE FOR nombre = lcLocalidadBuscada
	IF nombre = lcLocalidadBuscada
		lnidprovincia	= CsrLocalidad.idprovincia
		lccp 			= CsrLocalidad.cpostal
		lnidlocalidad	= CsrLocalidad.id
	ELSE
		lnidestado = 1
	ENDIF
	
	&&TresPImp	
	nTipoiva	= CsrDeudor.Codcateiva
	DO CASE 
	CASE nTipoiva = 6 &&CF
		lntipoiva = 3	
	CASE nTipoiva = 2 &&RNI
		lntipoiva = 9	
	CASE nTipoiva = 11 &&EX sin impuestos?
		lntipoiva = 4	
	OTHERWISE 
		lntipoiva = CsrDeudor.Codcateiva
	ENDCASE 
	IF lntipoiva=3
		*lcCuit=''
	ENDIF

	lcnumero	= strtrim(VAL(CsrDeudor.codigo),8)
	IF CsrDeudor.ctadeudor = 0
		SELECT CsrCtacte
		GO BOTTOM 
		lcnumero		= strtrim(VAL(CsrCtacte.cnumero)+1,8)
		lcOtro01		= CsrDeudor.codigo &&Almacenamos para relacionar al proveedor + articulo
		lnctadeudor		= 0
		lnctaacreedor	= 1
		lcingbrutosBA	= CsrDeudor.ingbrutos
		lcObserva		= "CONTACTO: " + LTRIM(CsrDeudor.obsercli)
	ENDIF 
	
	lcnombre	= NombreNi(ALLTRIM(UPPER(CsrDeudor.nombre)))  	
  	lcDire_Calle= RTRIM(UPPER(CsrDeudor.direccion))
  	lcDire_Nro	= RTRIM(UPPER(CsrDeudor.direnro))
  	lcDire_Piso	= RTRIM(UPPER(CsrDeudor.direpiso))
  	lcDire_Dpto	= RTRIM(UPPER(CsrDeudor.diredpto))
  	lcDireccion = lcDire_Calle + " " + lcDire_Nro + " P:"+ lcDire_Piso + " D:"+lcDire_Dpto
  	*lcCP		= LTRIM(lcCp)
  	
  	lcTelefono	= LTRIM(CsrDeudor.telefono)
  	IF LEN(ALLTRIM(lcTelefono)) = 0
  		lcTelefono	= LTRIM(CsrDeudor.telefono2)
  	ELSE
  		IF LEN(ALLTRIM(CsrDeudor.telefono2)) <> 0
  			lcObserva	= lcObserva + CHR(13) + "TELEFONO: " +LTRIM(CsrDeudor.telefono2)
  		ENDIF 
  	ENDIF 
  	IF LEN(ALLTRIM(CsrDeudor.CELULAR)) <> 0
  		lcObserva	= lcObserva + CHR(13) + "CELULAR: " +LTRIM(CsrDeudor.celular)
  	ENDIF 
  	IF LEN(ALLTRIM(CsrDeudor.fax)) <> 0
  		lcObserva	= lcObserva + CHR(13) + "FAX: " +LTRIM(CsrDeudor.fax)
  	ENDIF 
  
  	lcFax		= LTRIM(CsrDeudor.fax)
  	&&Tenemos que agregar el otro telefono a observaciones
  	ldfechac	= ctod(CsrDeudor.fecAlta)
  	lcEmail		= LTRIM(CsrDeudor.email)
  	
  	
  		
	INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
	,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
	,ctabanco,ctaotro,inscriiibb,fecinsiibb,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
	,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica;
	,bonif1,email,observa,cdatosfac,dni,cdirecalle,cdirenro,cdirepiso,cdiredpto);
	VALUES (lnid,lcNumero,lcnombre,lcDireccion,lccp;
	,lnidlocalidad,lnidprovincia,lctelefono,lntipoiva,lccuit,lnidcategoria,0,0;
	,lnidplanpago,lnidcanalvta,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
	,"",lnsaldoAuto,ldfechac,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago;
	,lnconvenio,lndctalogistica,lnBonif1,lcEmail,lcObserva,lcDatosFac,lcDNI;
	,lcDire_Calle,lcDire_Nro,lcDire_Piso,lcDire_Dpto)

	lnid = lnid + 1
	
	SELECT CsrDeudor           
ENDSCAN

IF LEN(LTRIM(cCadeCtacte)) != 0
	=oavisar.usuario("No se grabaron algunas clientes, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
ENDIF 

*!*	SELECT CsrCtacte
*!*	VISTA()


*!*	*!*	*!*	*!*	SELECT CsrAcreedor
*!*	*!*	*!*	*!*	cCadeCtacte = "" 
*!*	*!*	*!*	*!*	Oavisar.proceso('S','Procesando '+alias()) 
*!*	*!*	*!*	*!*	GO  TOP 
*!*	*!*	*!*	*!*	SCAN 
*!*	*!*	*!*	*!*	 	STORE 0 TO lnidestado, 	lnctadeudor ,	lnctaacreedor, 	lnctabanco,	lnctaotro, 	lndctalogistica;
*!*	*!*	*!*	*!*	 			,lnidcateibrng ,lncomision ,lnidlocalidad ,lnidprovincia ,lntipoiva ,lnidcategoria;
*!*	*!*	*!*	*!*				,lnidplanpago ,lnidcanalvta ,lnsaldoAuto ,lnlista ,lncomision ,lnconvenio,lndctalogistica;
*!*	*!*	*!*	*!*				,lnlista
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*	 	STORE 1100000001 TO lnidbarrio, lnidcategoria
*!*	*!*	*!*	*!*	 	STORE "" TO lcCuit,lcDNI,lcingbrutos,lcingbrutosBA,lcDatosFac
*!*	*!*	*!*	*!*	 	STORE DATETIME(1900,01,01,0,0,0) TO ldfechac,ldfecultcompra,ldfecultpago,lcfefin
*!*	*!*	*!*	*!*	 		
*!*	*!*	*!*	*!*	 	lnctaacreedor	= 1
*!*	*!*	*!*	*!*	 	lnidplanpago	= 1100000002 &&Por el momento todos de cuenta corriente		
*!*	*!*	*!*	*!*		lnidcanalvta	= 1100000006
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*		lcingbrutosBA = CsrAcreedor.ing_brutos
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*		lcCuit			= Cuit(strtrim(VAL(PeloCuit(CsrAcreedor.cuit)),15))
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*		&&Localidad
*!*	*!*	*!*	*!*		lnidlocalidad	= 1100000006 
*!*	*!*	*!*	*!*		*lcLocalidadBuscada = Ciudades(ALLTRIM(UPPER(CsrDeudor.Localidad)))
*!*	*!*	*!*	*!*		lcPostal		= ALLTRIM(CsrDeudor.Postal)
*!*	*!*	*!*	*!*		DO CASE
*!*	*!*	*!*	*!*		CASE lcPostal	= '1607'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100002654 &&VILLA ADELINA
*!*	*!*	*!*	*!*		CASE lcPostal	= '1611'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100001183 &&DON TORCUATO                  
*!*	*!*	*!*	*!*		CASE lcPostal	= '1650'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100002485 &&SAN MARTIN                    
*!*	*!*	*!*	*!*		CASE lcPostal	= '1678'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100000962 &&CASEROS (PDO. 3 DE FEBRERO)   
*!*	*!*	*!*	*!*		CASE lcPostal	= '1727'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100002059 &&MARCOS PAZ                    
*!*	*!*	*!*	*!*		CASE lcPostal	= '1900'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100001820 &&LA PLATA                      
*!*	*!*	*!*	*!*		CASE lcPostal	= '2752'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100000940 &&CAPITAN SARMIENTO             
*!*	*!*	*!*	*!*		CASE lcPostal	= '5000'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100008167 &&CORDOBA
*!*	*!*	*!*	*!*		CASE lcPostal	= '6740'
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100000984 &&CHACABUCO                     	
*!*	*!*	*!*	*!*		CASE '1708' $ lcPostal
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100002127 &&MORON                         
*!*	*!*	*!*	*!*		CASE '1824' $ lcPostal
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100001897 &&LANUS                         
*!*	*!*	*!*	*!*		CASE '1001' $ lcPostal
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100002991 &&CIUDAD	
*!*	*!*	*!*	*!*		CASE '2300' $ lcPostal
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100019029 &&RAFAELA
*!*	*!*	*!*	*!*		CASE '3002' $ lcPostal
*!*	*!*	*!*	*!*			lnidlocalidad	= 1100019118 &&SANTA FE
*!*	*!*	*!*	*!*		CASE lnPostal = 8000
*!*	*!*	*!*	*!*			lnidlocalidad	=1100000345 &&BAHIA BLANCA
*!*	*!*	*!*	*!*		OTHERWISE
*!*	*!*	*!*	*!*			SELECT CsrLocalidad
*!*	*!*	*!*	*!*			LOCATE FOR VAL(cpostal) = lnpostal
*!*	*!*	*!*	*!*			lnidlocalidad = CsrLocalidad.id
*!*	*!*	*!*	*!*		ENDCASE
*!*	*!*	*!*	*!*		SELECT CsrLocalidad
*!*	*!*	*!*	*!*		LOCATE FOR id = lnidlocalidad
*!*	*!*	*!*	*!*		IF id = lnidlocalidad
*!*	*!*	*!*	*!*			lnidprovincia = CsrLocalidad.idprovincia
*!*	*!*	*!*	*!*			lccp = CsrLocalidad.cpostal
*!*	*!*	*!*	*!*		ENDIF
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*		&&TresPImp		
*!*	*!*	*!*	*!*		lntipoiva = VAL(CsrAcreedor.tipo)
*!*	*!*	*!*	*!*		DO CASE 
*!*	*!*	*!*	*!*		CASE lntipoiva = 1
*!*	*!*	*!*	*!*			lntipoiva = 1	&&RI
*!*	*!*	*!*	*!*		CASE lntipoiva = 5
*!*	*!*	*!*	*!*			lntipoiva = 3	&&CF
*!*	*!*	*!*	*!*		CASE lntipoiva = 7
*!*	*!*	*!*	*!*			lntipoiva = 5	&&RM
*!*	*!*	*!*	*!*		CASE lntipoiva = 3
*!*	*!*	*!*	*!*			lntipoiva = 4	&&EXENTO
*!*	*!*	*!*	*!*		OTHERWISE 
*!*	*!*	*!*	*!*			lntipoiva = 7	&&NOCATEGORIZADO
*!*	*!*	*!*	*!*		ENDCASE 
*!*	*!*	*!*	*!*		IF lntipoiva=3
*!*	*!*	*!*	*!*			lcCuit=''
*!*	*!*	*!*	*!*		ENDIF


*!*	*!*	*!*	*!*		lcnombre	= NombreNi(ALLTRIM(UPPER(CsrAcreedor.nombre)))
*!*	*!*	*!*	*!*	  	lcnumero	= strtrim(lnCodProve,8)
*!*	*!*	*!*	*!*	  	lcDireccion	= UPPER(CsrAcreedor.domicilio)
*!*	*!*	*!*	*!*	  	lcCP		= LTRIM(lcCp)
*!*	*!*	*!*	*!*	  	lcTelefono	= LTRIM(CsrAcreedor.telefono)
*!*	*!*	*!*	*!*	  	lcFax		= LTRIM(CsrAcreedor.fax)
*!*	*!*	*!*	*!*	  	lnSaldoAuto	= CsrAcreedor.credito
*!*	*!*	*!*	*!*	  	lcEmail		= LTRIM(CsrAcreedor.email)
*!*	*!*	*!*	*!*	  	lcObserva	= LTRIM(CsrAcreedor.observaci)
*!*	*!*	*!*	*!*	  		
*!*	*!*	*!*	*!*		INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
*!*	*!*	*!*	*!*		,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
*!*	*!*	*!*	*!*		,ctabanco,ctaotro,inscri01,fecins01,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
*!*	*!*	*!*	*!*		,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica,esrecodevol;
*!*	*!*	*!*	*!*		,totalizabonif,bonif1,fax,email,observa,cdatosfac);
*!*	*!*	*!*	*!*		VALUES (lnid,lcNumero,lcnombre,lcDireccion,lccp;
*!*	*!*	*!*	*!*		,lnidlocalidad,lnidprovincia,lctelefono,lntipoiva,lccuit,lnidcategoria,0,0;
*!*	*!*	*!*	*!*		,lnidplanpago,lnidcanalvta,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
*!*	*!*	*!*	*!*		,"",lnsaldoAuto,ldfechac,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago;
*!*	*!*	*!*	*!*		,lnconvenio,lndctalogistica,0,0,lnBonif1,lcFax,lcEmail,lcObserva,lcDatosFac)

*!*	*!*	*!*	*!*		lnid = lnid + 1
*!*	*!*	*!*	*!*		lnCodProve = lnCodProve + 1 
*!*	*!*	*!*	*!*		
*!*	*!*	*!*	*!*		SELECT CsrAcreedor          
*!*	*!*	*!*	*!*	ENDSCAN

*!*	*!*	*!*	*!*	IF LEN(LTRIM(cCadeCtacte)) != 0
*!*	*!*	*!*	*!*		=oavisar.usuario("No se grabaron algunas proveedores, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
*!*	*!*	*!*	*!*	ENDIF 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')

SELECT CsrCtacte
*vista()

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES

