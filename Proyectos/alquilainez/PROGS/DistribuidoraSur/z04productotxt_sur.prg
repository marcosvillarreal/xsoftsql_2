PARAMETERS ldvacio,lcpath,lcBase
LOCAL lcData,lnid,lcfecha
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
llok = CargarTabla(lcData,'Producto',.t.)
llok = CargarTabla(lcData,'Variedad',.t.)
llok = CargarTabla(lcData,'Rubro',.t.)
llok = CargarTabla(lcData,'Marca',.t.)
llok = CargarTabla(lcData,'SubProducto',.t.)
llok = CargarTabla(lcData,'BloqueoProd',.t.)
llok = CargarTabla(lcData,'GamaBase',.t.)
llok = CargarTabla(lcData,'Deposito')
llok = CargarTabla(lcData,'Ubicacion',.t.)
llok = CargarTabla(lcData,'FuerzaVta')
llok = CargarTabla(lcData,'CanalVtaNeg',.t.)

*llok = CargarTabla(lcData,'Ctacte')
*llok = CargarTabla(lcData,'MapeoCarnico')

SET SAFETY ON

IF !llok
	RETURN .f.
ENDIF

IF USED('CsrLista')
	USE IN CsrLista
ENDIF 

SELECT CsrFuerzaVta
GO TOP 
lnidfuerzavta = CsrFuerzavta.id

Oavisar.proceso('S','Abriendo archivos') 

local lnidrubro, lnidmarca, lncodrubro
store 0 to lnidrubro, lnidmarca ,lncodrubro

CREATE CURSOR CsrLista (deta01 c(250),deta02 c(250),deta03 c(250) )
CREATE CURSOR CsrArticulo (Codigo c(8),Rubro c(20),Nombre c(100),Proveedor c(8);
		,Alicuota c(8),UniBulto c(10),UniVenta c(1),Costo c(15),Lista1 c(15),Lista2 c(15))
		
*CREATE CURSOR CsrPrecio (Codigo c(8),Lista c(8), Costo c(15))


SELECT CsrLista
cArchivo = ALLTRIM(lcpath )+"\artics.txt"
APPEND FROM  &cArchivo SDF

lcDelimitador = ";"
replace ALL deta01 WITH STRTRAN(deta01,"	",lcDelimitador)
replace ALL deta02 WITH STRTRAN(deta02,"	",lcDelimitador)
replace ALL deta03 WITH STRTRAN(deta03,"	",lcDelimitador)

Oavisar.proceso('S','Procesando '+alias()) 

cCadeCtacte = "" 


SELECT CsrLista
GO TOP 
*vista()
lnPrimeraOcurrencia = 13
leiunarticulo = .f.

*STOP()
SCAN 
	lnCantCampo = 28 &&Hay un campo vacio
	lnSiguienteOcurrencia = 1
	lnCamposLeidos = 1 &&Campos de CsrLista
	lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)

	IF AT(lcDelimitador,deta01)=1 AND (AT(lcDelimitador,deta01,2)=AT(lcDelimitador,deta01)+1 OR AT(lcDelimitador,deta01,3)=AT(lcDelimitador,deta01,2)+1)
		LOOP 
	ENDIF 
	
	IF AT(lcDelimitador,deta01)=lnPrimeraOcurrencia
		leiunarticulo = .t.
		STORE "" TO lcAcarreo
		STORE "" TO lcCodigo,lcRubro,lcNombre,lcProveedor,lcAlicuota,lcUniVenta
		STORE "" TO lcCosto, lcLista1, lcLista2
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
			lcCodigo		= UPPER(LimpiarCadena(IIF(j + i=1,lcCadena,lcCodigo)))
			lcRubro			= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcRubro)))
			lcNombre		= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcNombre)))
			lcProveedor		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcProveedor)))
			lcAlicuota		= IIF(j + i=12,lcCadena,lcalicuota)
			lcUniVenta		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcUniVenta)))
			lcCosto			= IIF(j + i=17,lcCadena,lcCosto)
			lcLista1		= IIF(j + i=18,lcCadena,lcLista1)
			lcLista2		= IIF(j + i=20,lcCadena,lcLista2)
			
			lnSiguienteOcurrencia = lnPos + 1
			i = i + 1
		ENDDO 
		lnSiguienteOcurrencia = 13
		lnCamposLeidos = lnCamposLeidos + 1
		lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)
		IF lnPos = 0 AND i <= lnCantCampo &&Si no termino, y no es un campo csrati q nop existe
			 j = j + (i - 1)
		ENDIF 
		*IF lnpos#0 AND i+j >= lnCantCampo
		IF lnCamposLeidos<4 AND i+j >= lnCantCampo
			EXIT 
		ENDIF 
	ENDDO 

	IF lnCamposLeidos>=1 AND i+j >= lnCantCampo
		&&Insertamos si se encontro una ultima ocurrencia con respecto a la cantidad de registros
		&&Que se grabaran en csrarti.
		&&Esta dise�ado para leer hasta los precios.
		&&Si se quiere leer todo. Se necesita un caracter de finalizado de linea.
		
		IF ASC(LEFT(lcNombre,1))=149 OR ASC(LEFT(lcNombre,1))=149 OR lentrim(lcNombre)=0 OR LEFT(lcNombre,3)='---'
			LOOP 
		ENDIF 
		lcCodigo = ALLTRIM(lcCodigo)
		INSERT INTO CsrArticulo (Codigo,Rubro,Nombre,Proveedor,Alicuota,UniVenta,Costo,Lista1,Lista2);
		values (lcCodigo,lcRubro,lcNombre,lcProveedor,lcAlicuota,lcUniVenta,lcCosto,lcLista1,lcLista2)
				
		*replace descripcion WITH lmDescripcion IN FsrArticulo
		leiunarticulo = .f.
	ENDIF 
ENDSCAN 

SELECT CsrArticulo
vista()

*!*	SET SAFETY OFF 
*!*	SELECT CsrLista
*!*	ZAP 
*!*	SET SAFETY ON 
*!*	cArchivo = ALLTRIM(lcpath )+"\precios.csv"
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
*!*	*STOP()
*!*	SCAN 
*!*		lnCantCampo = 6 &&Hay un campo vacio
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
*!*			STORE "" TO lcCodigo,lcLista,lcCosto
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
*!*				lcCodigo	= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcCodigo)))
*!*				lcLista		= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcLista)))
*!*				lcCosto		= UPPER((IIF(j + i=6,lcCadena,lcCosto)))
*!*								
*!*				lnSiguienteOcurrencia = lnPos + 1
*!*				i = i + 1
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
*!*			lcCosto = STRTRAN(lcCosto,',','.')
*!*			INSERT INTO CsrPRecio (Codigo,Lista,Costo);
*!*			values (lcCodigo,lcLista,lcCosto)
*!*					
*!*			*replace descripcion WITH lmDescripcion IN FsrArticulo
*!*			leiunarticulo = .f.
*!*		ENDIF 
*!*	ENDSCAN

*!*	SELECT CsrPrecio
*!*	*vista()

lnid = RecuperarID('CsrRubro',Goapp.sucursal10)
lncodrubro = 1
SELECT distinct UPPER(rubro) as nombre FROM CsrArticulo  INTO CURSOR FsrRubro

SELECT FsrRubro
GO top
SCAN 
	STORE 1100000001 TO lntipoprod,lntipovta 
	lnretibruto	= 1 &&IIF(CsrSeccion.perceib="S",1,0)

	lcnombre	= "RUBRO " + NombreNi(ALLTRIM(UPPER(FsrRubro.nombre)))
	INSERT INTO CsrRubro (id,numero,nombre,idtipoprod,idtipovta,perceibruto,idfuerzavta) ;
	VALUES (lnid,lncodrubro,lcnombre,lntipoprod,lntipovta,lnretibruto,lnidfuerzavta)
	lnid = lnid +1 
	lncodrubro = lncodrubro + 1 
ENDSCAN 

lnid = RecuperarID('CsrMarca',Goapp.sucursal10)
INSERT INTO Csrmarca (id,numero,nombre,idfuerzavta);
VALUES (lnid,1,"GENERAL",lnidfuerzavta)

lnidcanalvtaneg = RecuperarID('CsrCanalVtaNeg',Goapp.sucursal10)

lnidcanalvta = 1100000003

lnid = RecuperarID('CsrUbicacion',Goapp.sucursal10)
INSERT INTO CsrUbicacion (id,numero,nombre)	VALUES (lnid,'1','GENERAL')

TEXT TO lcCmd TEXTMERGE NOSHOW 
SELECT CsrCtacte.* FROM Ctacte as CsrCtacte WHERE ctaacreedor = 1
ENDTEXT 
=CrearCursorAdapter('CsrCtacte',lcCmd)

SELECT CsrArticulo
Oavisar.proceso('S','Procesando '+alias()) 
GO top
stop()
SCAN FOR !EOF()
	SELECT CsrProducto
	
	LOCATE FOR numero=VAL(CsrArticulo.codigo)
	IF numero=VAL(CsrArticulo.codigo)
		SELECT CsrArticulo
		LOOP 
	ENDIF
	
	STORE 0 TO lnFlete,lnBonif1,lnBonif2,lnBonif3,lnBonif4,lnFletePorce,lnPrevta1,lnPrevta2,lnPrevta3,lnPreventa4
	STORE 0 TO lnSugerido,lnPrevtaF1,lnPrevtaf2,lnPrevtaf3,lnPrevetaf4, lninterno
	STORE 0 TO lnidctacte, lnidseccion,	lnidmarca,	lnidubicacion,lnidenvase
	STORE 0 TO lnnolista, lnnofactu, lnespromo, lnsireparto,lnidctacpra, lnidctavta , lnidfrio
	STORE 0 TO lnCosto,lnCostoBon,lnUtil1,lnUtil2,lnUtil3,lnUtil4,lnPeso,lnidtipocarnico
	
	SELECT CsrCtacte
    LOCATE FOR ctaacreedor=1
    IF FOUND()
    	lnidctacte = Csrctacte.id
    ENDIF

    SELECT CsrRubro
    LOCATE FOR RIGHT('00'+RIGHT(RTRIM(nombre),2),2)=RIGHT('00'+ALLTRIM(Csrarticulo.rubro),2)
    IF NOT FOUND()
    	GO BOTTOM
    ENDIF 
    lnidseccion = CsrRubro.id
    	
    SELECT CsrMarca
    GO TOP 
    Lnidmarca = CsrMarca.id
    	
	SELECT CsrUbicacion
	GO TOP 
	lnidubicacion = CsrUbicacion.id

	lcnombre	= NombreNi(alltrim(CsrArticulo.nombre))
	lnCodigo	= VAL(CsrArticulo.codigo)
	lcCodArti	= "" &&CsrArticulo.codArti
	lnfracciona = 1 
    lnidestado 	= 1 
    lnTasa		= VAL(CsrArticulo.Alicuota)
    lnidiva     = IIF(lnTasa=0,1100000002,1100000003) &&VAL(STR(goapp.sucursal10+10)+strzero(IIF(Csrarticulo.tablaiva=1,2,1),8))
   	lnunibulto	= 1 
    lnidtipovta = 1 &&UNIDADES=1 ,	BULTOS = 2.
    lnvtakilos	= IIF(UPPER(CsrArticulo.univenta)$"KILOS-KG",1,0)
   	lnidforma 	= 1100000001
	lnpeso		= 1
	
	ldfecha          = DATETIME(YEAR(DATE()),MONTH(DATE()),DAY(DATE()),0,0,0)
	ldfechaulcpr 	= ldfecha
	ldfechamodf 	= DATE() &&CTOD(CsrArticulo.fecModf)
	ldfechabonif	= CTOD('01-01-1900') &&GOMONTH(ldfecha,360*20)
			
*!*		lnprevta1	= VAL(Csrarticulo.prevta1)
*!*		lnprevtaf1	= VAL(CsrArticulo.prevtaf1)
*!*		lnUtil1		= IIF(lnCosto=0,0,round(lnprevta1 * 100 / lnCosto,3) - 100)
*!*		lnprevta2	= VAL(Csrarticulo.prevta2)
*!*		lnprevtaf2	= VAL(CsrArticulo.prevtaf2)
*!*		lnUtil2		= IIF(lnCosto=0,0,round(lnprevta2 * 100 / lnCosto,3) - 100)
*!*		lnprevta3	= VAL(Csrarticulo.prevta3)
*!*		lnprevtaf3	= VAL(CsrArticulo.prevtaf3)
*!*		lnUtil3		= IIF(lnCosto=0,0,round(lnprevta3 * 100 / lnCosto,3) - 100)
*!*		lnUtil4		= 0
*!*		lnPeso		= 0
					
*!*		SELECT CsrPrecio
*!*		LOCATE FOR VAL(CsrPrecio.codigo) = VAL(CsrArticulo.codigo) AND VAL(CsrPrecio.lista)=1
*!*		IF VAL(CsrPrecio.codigo) = VAL(CsrArticulo.codigo) AND VAL(CsrPrecio.lista)=1
		lnCosto		= VAL(CsrArticulo.costo)
		lnCostoBon	= lnCosto
		lnprevta1	= VAL(CsrArticulo.lista1)
		lnprevtaX	= VAL(CsrArticulo.lista2)
		
		lnUtil1		= red((lnprevta1 * 100) /  lnCosto,2) - 100
		lnprevtaf1	= red(lnprevta1 * (1 + (IIF(lnTasa=0,21,10.5)/100)),2)
		
		lnUtilX		= red((lnprevtaX * 100) /  lnCosto,2) - 100
		lnprevtafX	= red(lnprevtaX * (1 + (IIF(lnTasa=0,21,10.5)/100)),2)
		
*!*		ENDIF 
	
	INSERT INTO Csrproducto (id,numero,nombre,codalfa,idiva,costo,margen1,prevta1,margen2,; 
	prevta2,switch,idunidad,idtprod,idtamano,idcatego,idubicacio,idorigen,incluirped,idctacte,idrubro,margen3,;
	prevta3,margen4,prevta4,interno,unibulto,peso,idtipovta,idforma,fracciona,nomodifica,nombulto,puntope,;
	idmoneda,incluirped,flete,feculcpra,fecalta,fecmodi,feculvta,bonif1,bonif2,bonif3,bonif4,costobon,idmarca,segflete,idestado,;
	nolista,nofactura,minimofac,espromocion,prevtaf1,prevtaf2,prevtaf3,prevtaf4,idfrio,sugerido,idingbrutos,divisible,;
	codartprod,desc1,min1,desc2,min2,desc3,min3,vtakilos,cprakilos,fecoferta,internoporce,idctacpra,idctavta;
	,idenvase,fleteporce); 	
	values (lnid, lncodigo, lcnombre, lccodarti, lnidiva, lncosto,	;
	lnutil1, lnprevta1, lnutil2, lnprevta2, '00000', 1,1,1,1,lnidubicacion,1,1,lnidctacte, lnidseccion, lnutil3, ;
	lnprevta3, 0,0,lninterno, lnunibulto,lnpeso, lnidtipovta,lnidforma,lnfracciona,0,'',0,;
	1,1,lnflete,	ldfechaulcpr, ldfecha, ldfechamodf, ldfecha, lnbonif1,lnbonif2, lnbonif3,;
	lnbonif4,lnCostoBon ,lnidmarca,0, lnidestado	,lnnolista, lnnofactu,0,	lnespromo,lnprevtaf1,lnprevtaf2,lnprevtaf3,0,lnidfrio,;
	lnsugerido,1,lnsireparto,"",0, 0,;
	0, 0, 0, 0,lnvtakilos,lnvtakilos,ldfechabonif,0;
	,lnidctacpra,lnidctavta;
	,lnidenvase,lnfleteporce)		
	
	INSERT INTO CsrCanalVtaNeg (id, idcanalvta, idproducto, feccostobon, costobon, margen1, prevta1, prevtaf1;
	,feccorte);
	values(lnidcanalvtaneg,lnidcanalvta,lnid,ldfechamodf,lnCostoBon,lnUtilX,lnPrevtaX,lnPrevtafX,DATE()+15)
	
	lnid = lnid + 1
	lnidcanalvtaneg = lnidcanalvtaneg + 1 
	SELECT CsrArticulo   				
ENDSCAN

SELECT CsrProducto
GO TOP 
*vista()

   	
Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')


USE IN CsrCtacte

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES