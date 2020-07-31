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
llok = CargarTabla(lcData,'Localidad')
llok = CargarTabla(lcData,'Ctacte',.t.)
llok = CargarTabla(lcData,'Provincia')
*!*	llok = CargarTabla(lcData,'CateIbRn',.t.)
*!*	llok = CargarTabla(lcData,'CateIbRNg',.t.)
llok = CargarTabla(lcData,'TipoIva')
llok = CargarTabla(lcData,'CateCtacte',.t.)
llok = CargarTabla(lcData,'Barrio',.t.)
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Sucursal',.t.)
SET SAFETY ON
Oavisar.proceso('S','Abriendo archivos') 


USE  ALLTRIM(lcpath)+"\clientes" in 0 alias CsrDeudorViej EXCLUSIVE

USE  ALLTRIM(lcpath)+"\proveed" in 0 alias CsrAcreedor EXCLUSIVE

*!*	USE ALLTRIM(lcpath)+"\gestion\localida" in 0 alias CsrLocalidadViejo EXCLUSIVE

*!*	USE ALLTRIM(lcpath)+"\gestion\provinci" in 0 alias CsrProvinciaViejo EXCLUSIVE

*!*	USE ALLTRIM(lcpath)+"\gestion\cateibrn" in 0 alias CsrCaterionegro EXCLUSIVE

*!*	USE ALLTRIM(lcpath)+"\gestion\categori" in 0 alias CsrCategoriaDeudor EXCLUSIVE

*!*	USE ALLTRIM(lcpath)+"\gestion\barrio" in 0 alias CsrBarrioviejo EXCLUSIVE

Oavisar.proceso('S','Procesando '+alias()) 
SELECT * FROM CsrDeudorViej ORDER BY numero INTO CURSOR CsrDeudor

*!*	SELECT CsrCaterionegro
*!*	Oavisar.proceso('S','Procesando '+alias()) 
*!*	LOCAL lnid
*!*	lnid = RecuperarID('CsrCateIbRNg',Goapp.sucursal10)

*!*	SELECT CsrProvinciaViejo
*!*	GO top
*!*	SCAN FOR !EOF()
*!*		lcnombre=NombreNi(ALLTRIM(UPPER(CsrProvinciaViejo.nombre)))          
*!*		SELECT CsrProvincia
*!*		LOCATE FOR nombre$lcnombre
*!*		IF nombre$lcnombre
*!*			replace alicuota2 WITH ibrutosa,alicuota4 WITH ibrutosb,jurisdiccion WITH codjuri IN CsrProvincia
*!*		ENDIF 
*!*		SELECT CsrProvinciaViejo
*!*	ENDSCAN 

*!*	SELECT CsrCaterionegro
*!*	GO top
*!*	SCAN FOR !EOF() 
*!*		lcnombre=NombreNi(ALLTRIM(UPPER(CsrcateRioNegro.nombre)))          
*!*	   	INSERT INTO CsrCateIbRNg (id,numero,nombre,porperce,porrete);
*!*	   	VALUES (lnid,CsrCaterionegro.numero,UPPER(lcnombre),CsrcateRioNegro.porcentaje,0)
*!*	   	lnid = lnid +1
*!*	ENDSCAN

*!*	SELECT CsrCategoriaDeudor
*!*	Oavisar.proceso('S','Procesando '+alias()) 
*!*	GO top
lnid = RecuperarID('CsrCatectacte',Goapp.sucursal10)

*!*	SELECT CsrCategoriaDeudor
*!*	SCAN FOR !EOF()    
*!*		&&&comprobar �
*!*		lcnombre=NombreNi(ALLTRIM(UPPER(CsrCategoriaDeudor.nombre)))
*!*		INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch);
*!*	    VALUES (lnid,CsrCategoriaDeudor.numero,lcnombre,0,0,0,'00000')
*!*	    lnid = lnid +1 
*!*	ENDSCAN
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,1,'CLIENTES',0,0,0,'00000')
lnid = lnid +1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,2,'CTA CTE BANCO',0,0,0,'00000')
lnid = lnid +1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,3,'CTA CTE PROVEEDOR',0,0,0,'01000')
lnid = lnid +1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,4,'CTA CTE SERVICIO',0,0,0,'00000')

SELECT CsrLocalidad
IF FSIZE('id')>4
   lntamloc = 10
ELSE 
   lntamloc = 8
ENDIF 

SELECT CsrProvincia
IF FSIZE('id')>4
   lntamprov = 10
ELSE 
   lntamprov = 8
ENDIF 

SELECT CsrTipoIva
IF FSIZE('id')>4
   lntamiva = 10
ELSE 
   lntamiva = 8
ENDIF 

SELECT CsrCateCtacte
IF FSIZE('id')>4
   lntamcate = 10
ELSE 
   lntamcate = 8
ENDIF

lnid = RecuperarID('CsrCtacte',Goapp.sucursal10)

cCadeCtacte = "" 

*STOP()
SELECT CsrDeudor
Oavisar.proceso('S','Procesando '+alias()) 
GO  TOP 

SCAN 
 	SELECT CsrCtacte
 	LOCATE FOR VAL(cnumero) = CsrDeudor.numero
 	IF VAL(cnumero) = CsrDeudor.numero
 		cCadeCtacte = LTRIM(cCadeCtacte) + IIF(LEN(LTRIM(cCadeCtacte)) != 0,",","") + STRtrim(CsrDeudor.numero,10) 
 		SELECT CsrDeudor
 		LOOP 
 		
 	ENDIF 
 	SELECT CsrDeudor 
 		lnidlocalidad =	1100000958 &&VAL(str(Goapp.sucursal10+10,2)+strzero(6,lntamloc))
		lnidprovincia =	1100000002 &&VAL(str(Goapp.sucursal10+10,2)+strzero(2,lntamprov))
		lccp = ""
		lcLocalidadBuscada = CsrDeudor.Localidad
		lcLocalidadBuscada = Ciudades(lcLocalidadBuscada)
		IF EMPTY(lcLocalidadBuscada)
			SELECT CsrLocalidad
			LOCATE FOR VAL(cpostal)=CsrDeudor.cP
			lcLocalidadBuscada = CsrLocalidad.Nombre
			lnidlocalidad = CsrLocalidad.id
			lnidprovincia = CsrLocalidad.idprovincia
			lccp = CsrLocalidad.cpostal
		ELSE 
			SELECT CsrLocalidad
			LOCATE FOR ALLTRIM(nombre) = ALLTRIM(lcLocalidadBuscada)
			IF FOUND()
				lnidlocalidad = CsrLocalidad.id
				lnidprovincia = CsrLocalidad.idprovincia
				lccp = CsrLocalidad.cpostal
			ENDIF
		ENDIF 
		
		lnidestado = 0
    	lnctadeudor = 1
    	lnctaacreedor = 0
    	lnctabanco = 0
    	lnctaotro  = 0
    	lndctalogistica = 0
        
		SELECT CsrCateCtacte
		LOCATE FOR numero = 1
		IF FOUND()
			lnidcategoria = CsrCateCtacte.id
		ENDIF 

		SELECT CsrDeudor
		lntipoiva = tipocuit
		IF lntipoiva=7
			lntipoiva = 5
		ENDIF 
		IF lntipoiva=3
			lncuit=''
		ENDIF
		lnidcateibrng =0		
		
		lnidplanpago = CsrDeudor.tipo_pago
		IF CsrDeudor.tipo_pago=0
			lnidplanpago=1
		ENDIF 
		IF lnidplanpago>2 &&=3 remito 3ro
			lnidplanpago = 10
			lndctalogistica=1
		ENDIF 
		lnidplanpago =VAL("11"+strzero(lnidplanpago,8))
		
              
		lcfefin       = DATETIME(1900,01,01,0,0,0)
		lnlista		= 1 &&CsrDeudor.Lista
		ldfechac = CsrDeudor.Fechaulcpr
		ldfeculcompra = lcfefin
		IF !EMPTY(ldfechac)
			ldfecultcompra = DATETIME(YEAR(ldfechac),MONTH(ldfechac),DAY(ldfechac),0,0,0)
		ENDIF 
		ldfechap = CsrDeudor.Fechaulpag
		ldfecultpago = lcfefin
		IF !EMPTY(ldfechap)
			ldfecultpago = DATETIME(YEAR(ldfechap),MONTH(ldfechap),DAY(ldfechap),0,0,0)
		ENDIF 
		lcingbrutos = " "
		lcingbrutosBA = "" &&CsrDeudor.ibrutos
		lncomision = 0 &&CsrDeudor.comision
		lnconvenio = 0
		
		lnidcateibrng = 0

*!*			IF CsrDeudor.provincia = "R"
*!*				lcingbrutos = CsrDeudor.ibrutos
*!*				lcingbrutosBA = " "
*!*			ENDIF 
		
		lccuit =STRTRAN(STRTRAN(CsrDeudor.cuit,".","-"),"*","-")
		IF VAL(lccuit)=0
			lindcateibrng=0
		ENDIF 

		lcnombre = NombreNi(ALLTRIM(UPPER(CsrDeudor.nombre)))
      	
      	TRY 	
          INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
          ,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
          ,ctabanco,ctaotro,inscri01,fecins01,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
          ,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica,esrecodevol;
          ,totalizabonif);
		  VALUES (lnid,LTRIM(STR(CsrDeudor.numero)),lcnombre,UPPER(CsrDeudor.direccion),LTRIM(lccp);
		  ,lnidlocalidad,lnidprovincia,CsrDeudor.telefono,lntipoiva,lccuit,lnidcategoria,0,0;
		  ,lnidplanpago,1100000006,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
		  ,"",0,lcfefin,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago;
		  ,lnconvenio,lndctalogistica,0,0)
		CATCH 
			STOP()
		ENDTRY 
*!*			*IF lnidcateibrng<>VAL(STR(Goapp.sucursal10 + 10,2))+4 AND lntipoiva <>VAL(STR(Goapp.sucursal10 + 10,2))+ 3
*!*			SELECT CsrCateibrn
*!*			LOCATE FOR  idctacte = lnid
*!*			IF !FOUND() AND lnidcateibrng <> 0
*!*				lccuit =STRTRAN(CsrDeudor.cuit,"-","")
*!*				IF VAL(lccuit)<>0
*!*					lccuit=STRTRAN(lccuit,"-","")
*!*					INSERT INTO CsrCateibrn (cuit,idctacte,numero,porperce,porrete);
*!*					VALUES (lccuit,lnid,lnidcateibrng,CsrCateIbRNg.porperce,CsrCateibRng.porrete)
*!*				ENDIF 
*!*			ENDIF 
		lnid = lnid + 1
	          
ENDSCAN

IF LEN(LTRIM(cCadeCtacte)) != 0
	=oavisar.usuario("No se grabaron algunas clientes, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
ENDIF 

SELECT CsrAcreedor
cCadeCtacte = "" 
Oavisar.proceso('S','Procesando '+alias()) 
GO  TOP 
SCAN 

 	
		SELECT CsrCtacte
		LOCATE FOR cnumero=LTRIM(STR(1000+CsrAcreedor.numero))
		IF FOUND()
			cCadeCtacte = LTRIM(cCadeCtacte) + IIF(LEN(LTRIM(cCadeCtacte)) != 0,",","") + STRtrim(CsrAcreedor.numero,10) 
			SELECT  CsrAcreedor
			LOOP
		ENDIF
		SELECT CsrAcreedor
		lcLocalidadBuscada = CsrAcreedor.Localidad
		lcLocalidadBuscada = Ciudades(lcLocalidadBuscada )
		
		lnidlocalidad =	 VAL(str(11,2)+strzero(6,lntamloc))
		lnidprovincia =	 VAL(str(11,2)+strzero(2,lntamprov))
		lccp			 = ""
		SELECT CsrLocalidad
		LOCATE FOR ALLTRIM(nombre) = ALLTRIM(lcLocalidadBuscada)
		IF FOUND()
			lnidlocalidad = CsrLocalidad.id
			lnidprovincia = CsrLocalidad.idprovincia
			lccp = CsrLocalidad.cpostal
		ENDIF
		
		SELECT CsrAcreedor
		lntipoiva = tipocuit
		IF lntipoiva=7
			lntipoiva = 5
		ENDIF 
		IF lntipoiva=3
			lncuit=''
		ENDIF
		lnidcateibrng =0
		
		lnidcategoria = 2
		SELECT CsrCateCtacte
		LOCATE FOR numero=lnidcategoria
		lnidcategoria = CsrCateCtacte.id
		
		lnidestado = 0
    	lnctadeudor = 0
    	lnctaacreedor=1
    	lnctabanco = 0
    	lnctaotro  = 0
    	lnctalogistica = 0
		lcfefin       = DATETIME(1900,01,01,0,0,0)
		lnlista = 0
		ldfechac = CsrAcreedor.Fechaulcpr
		ldfeculcompra = lcfefin
		IF !EMPTY(ldfechac)
			ldfecultcompra = DATETIME(YEAR(ldfechac),MONTH(ldfechac),DAY(ldfechac),0,0,0)
		ENDIF 
		ldfechap = CsrAcreedor.Fechaulpag
		ldfeculTpago = lcfefin
		IF !EMPTY(ldfechap)
			ldfecultpago = DATETIME(YEAR(ldfechap),MONTH(ldfechap),DAY(ldfechap),0,0,0)
		ENDIF 
		lcingbrutosBA = CsrAcreedor.ibrutos
		lcingbrutos = ""
		IF CsrAcreedor.provincia = "R"
			lcingbrutos = CsrAcreedor.ibrutos
			lcingbrutosBA = " "
		ENDIF 
		
		lnSaldoAnt = 0
		lncomision = 0
		lntotalizabonif = 0
    	lnesrecodevol = 0
		*lnidcateibrng =VAL(STR(Goapp.sucursal10 + 10,2)+LTRIM(STR(4)))
		lcnombre = NombreNi(ALLTRIM(UPPER(CsrAcreedor.nombre))) 
  
        INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
        ,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
        ,ctabanco,ctaotro,inscri01,fecins01,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
        ,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica,esrecodevol;
        ,totalizabonif);
		VALUES (lnid,LTRIM(STR(1000+CsrAcreedor.numero)),lcnombre,CsrAcreedor.direccion,LTRIM(lccp);
		,lnidlocalidad,lnidprovincia,CsrAcreedor.telefono,lntipoiva,CsrAcreedor.cuit,lnidcategoria,0,lnSaldoAnt;
		,1100000002,1100000006,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
		,"",0,lcfefin,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago,0;
		,lnctalogistica,lnesrecodevol,lntotalizabonif)
		          
*!*		SELECT CsrCateibrn
*!*		LOCATE FOR  idctacte = lnid
*!*		IF !FOUND() AND lnidcateibrng <> 0
*!*			lccuit =STRTRAN(CsrAcreedor.cuit,"-","")
*!*			IF VAL(lccuit)<>0
*!*				lccuit=STRTRAN(lccuit,"-","")
*!*				INSERT INTO CsrCateibrn (cuit,idctacte,numero,porperce,porrete);
*!*				VALUES (lccuit,lnid,lnidcateibrng,CsrCateIbRNg.porperce,CsrCateIbRNg.porrete)
*!*			ENDIF 
*!*		ENDIF 
         
		lnid = lnid + 1
ENDSCAN

IF LEN(LTRIM(cCadeCtacte)) != 0
	=oavisar.usuario("No se grabaron algunas proveedores, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
ENDIF 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
USE in CsrDeudorViej 
*!*	USE in CsrAcreedor 
*!*	*!*	USE in CsrLocalidadViejo 
*!*	USE in CsrProvinciaViejo 
*!*	USE in CsrCaterionegro 
*!*	USE in CsrCategoriaDeudor 
*!*	USE in CsrBarrioviejo 