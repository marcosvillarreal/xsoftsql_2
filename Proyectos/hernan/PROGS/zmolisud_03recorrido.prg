PARAMETERS ldvacio,lcpath,lcBase
LOCAL lcData,lnid,lcfecha
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)
lcData = lcBase

DO setup
SET PROCEDURE TO proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE TO syserror.prg ADDITIVE  

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

Oavisar.proceso('S','Vaciando archivos') 
llok = .t.
llok = CargarTabla(lcData,'Zona',.t.)
llok = CargarTabla(lcData,'Ctacte')
llok = CargarTabla(lcData,'ZonaRuta',.t.)
llok = CargarTabla(lcData,'Vendedor',.t.)
llok = CargarTabla(lcData,'Fletero',.t.)
llok = CargarTabla(lcData,'Ruta',.t.)
llok = CargarTabla(lcData,'RutaVdor',.t.)
llok = CargarTabla(lcData,'CabeRuta',.t.)
llok = CargarTabla(lcData,'CuerRuta',.t.)
llok = CargarTabla(lcData,'FuerzaVta')
llok = CargarTabla(lcData,'PlanCue')
SET SAFETY ON

IF !llok
	RETURN .f.
ENDIF 

Oavisar.proceso('S','Abriendo archivos') 

USE ALLTRIM(lcpath)+"\gestion\clientes" IN 0 ALIAS FsrDeudor EXCLUSIVE

USE ALLTRIM(lcpath)+"\gestion\zona" IN 0 ALIAS FsrZona EXCLUSIVE

USE ALLTRIM(lcpath)+"\gestion\vendedor" IN 0 ALIAS FsrVendedor EXCLUSIVE


LOCAL lnid 
lnid = RecuperarID('CsrVendedor',Goapp.sucursal10)

SELECT FsrVendedor
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
    IF numero=0
       loop
   ENDIF
   lnprevta = 1
   lnestado = 1
   lcnombre	= NombreNi(alltrim(UPPER(FsrVendedor.nombre)))
   INSERT INTO Csrvendedor (id,numero,nombre,comision,planilla,prevta,estado,lista,idctacte;
   ,acumulavale);
   VALUES (lnid,FsrVendedor.numero,lcnombre,FsrVendedor.comision,1,lnprevta,lnestado,1,0,0)
   lnid = lnid + 1

ENDSCAN

lnid = RecuperarID('CsrZona',Goapp.sucursal10)

SELECT FsrZona
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()  
           lcnombre=NombreNi(alltrim(UPPER(FsrZona.nombre)))
           lnnumero=VAL(FsrZona.numero)
           INSERT INTO CsrZona (id,numero,nombre,porflete,abrevia);
           			 VALUES (lnid,lnnumero,lcnombre,0,STR(lnnumero))
	   
           lnid = lnid + 1
ENDSCAN

LOCAL lnidcabeza, lnidrutavdor,lnidzonaruta,lnidcuerruta

lnid = RecuperarID('CsrRuta',Goapp.sucursal10)
*****
lnidcabeza = RecuperarID('CsrCabeRuta',Goapp.sucursal10)
*******
lnidrutavdor = RecuperarID('CsrRutaVdor',Goapp.sucursal10)
*****
lnidzonaruta = RecuperarID('CsrZonaRuta',Goapp.sucursal10)
*******
lnidcuerruta = RecuperarID('CsrCuerRuta',Goapp.sucursal10)

lnChequeVendedor = .f.
IF !lnChequeVendedor 
	oavisar.usuario("Las guias se arman desde la ruta y el primer vendedor encontrado")
ENDIF 

lnNumRuta = 1
SELECT FsrDeudor
Oavisar.proceso('S','Procesando Guia de visitas') 
GO top
 
SCAN FOR !EOF()

	SELECT CsrCtacte
	LOCATE FOR VAL(cnumero)=FsrDeudor.numero
       IF VAL(cnumero) # FsrDeudor.numero
           SELECT FsrDeudor
           LOOP 
       ENDIF 
        
	SELECT CsrVendedor
	LOCATE FOR numero=FsrDeudor.vendedor
	IF numero#FsrDeudor.vendedor
		SELECT FsrDeudor
		LOOP
	ENDIF 
	 
	SELECT CsrZona
	LOCATE FOR numero=VAL(FsrDeudor.zona)
	IF numero#VAL(FsrDeudor.zona )
		SELECT CsrZona
	 	GO TOP 
      ENDIF 
	 		
	SELECT CsrRuta
	LOCATE FOR nombre=TRIM(Csrzona.nombre)
	IF nombre#TRIM(Csrzona.nombre)
		INSERT INTO CsrRuta (id,numero,nombre) ;
		VALUES (lnid,lnNumRuta,TRIM(Csrzona.nombre))		     		
		lnid = lnid + 1
		lnNumRuta = lnNumRuta +1
	ENDIF 

	SELECT Csrzonaruta
	LOCATE FOR idzona=Csrzona.id AND idruta = Csrruta.id
	IF idzona#Csrzona.id OR idruta # Csrruta.id
		INSERT INTO Csrzonaruta (id,idzona,idruta,switch);
		VALUES (lnidzonaruta,Csrzona.id,Csrruta.id,'00000')
		lnidzonaruta = lnidzonaruta + 1
    ENDIF 
     
    IF lnChequeVendedor  
		SELECT CsrRutaVdor
		LOCATE FOR idvendedor=Csrvendedor.id  AND idruta=Csrruta.id
		IF idvendedor#Csrvendedor.id  OR idruta#Csrruta.id
			INSERT INTO CsrRutaVdor (id,idruta,idvendedor,switch,idfuerzavta);
			VALUES (lnidrutavdor,Csrruta.id,Csrvendedor.id,'00000',1100000001)
			lnidrutavdor = lnidrutavdor + 1

		ENDIF 
	 ELSE 
		SELECT CsrRutaVdor
		LOCATE FOR idruta=CsrRuta.id
		IF idruta#Csrruta.id
			INSERT INTO CsrRutaVdor (id,idruta,idvendedor,switch,idfuerzavta);
			VALUES (lnidrutavdor,Csrruta.id,Csrvendedor.id,'00000',1100000001)
			lnidrutavdor = lnidrutavdor + 1
		ENDIF
	ENDIF  
	
	lcdias = ALLTRIM(STR(23456))
	FOR i=1 TO LEN(lcdias)
		SELECT CsrCaberuta
		LOCATE FOR idrutavdor=Csrrutavdor.id AND dia=VAL(SUBSTR(lcdias,i,1))
		IF idrutavdor#Csrrutavdor.id OR dia#VAL(SUBSTR(lcdias,i,1))
			INSERT INTO Csrcaberuta (id,idrutavdor,dia) ;
			VALUES (lnidcabeza,Csrrutavdor.id,VAL(SUBSTR(lcdias,i,1)))
			lnidcabeza = lnidcabeza + 1
		ENDIF 
	
		SELECT CsrCuerruta
		LOCATE FOR idcaberuta=Csrcaberuta.id AND idctacte=Csrctacte.id AND orden=Csrrecorrido.orden
		IF idcaberuta#Csrcaberuta.id OR idctacte#Csrctacte.id OR orden#Csrdeudor.orden
   			SELECT MAX(orden) as orden FROM CsrCuerRuta WHERE idcaberuta = CsrCabeRuta.id;
   			INTO CURSOR CsrMaxOrden READWRITE 
   			lnorden = IIF(RECCOUNT('CsrMaxOrden')=0,0,CsrMaxOrden.orden) + 1 
   			
   			INSERT INTO Csrcuerruta (id,idcaberuta,idctacte,orden,turno) ;
   			VALUES (lnidcuerruta,Csrcaberuta.id,Csrctacte.id,lnorden,1)
   			lnidcuerruta = lnidcuerruta + 1
		ENDIF 		   				
		
	NEXT 

	SELECT FsrDeudor
ENDSCAN

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES

USE IN FsrDeudor	
USE in FsrZona 
USE IN FsrVendedor 
