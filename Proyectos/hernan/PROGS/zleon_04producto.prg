PARAMETERS ldvacio,lcpath
ldvacio = IIF(PCOUNT()<1,"",ldvacio)
lcpath = IIF(PCOUNT()<2,"",lcpath)


DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE 

SET SAFETY OFF

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON
Oavisar.proceso('S','Abriendo archivos') 
llok = .t.
llok = CargarTabla('leon','Producto',.t.)
llok = CargarTabla('leon','Variedad',.t.)
llok = CargarTabla('leon','TipoFrio',.t.)
llok = CargarTabla('leon','Rubro',.t.)
llok = CargarTabla('leon','Marca',.t.)
llok = CargarTabla('leon','SubProducto',.t.)
llok = CargarTabla('leon','BloqueoProd',.t.)
llok = CargarTabla('leon','GamaBase',.t.)
llok = CargarTabla('leon','Deposito',.t.)
llok = CargarTabla('leon','Ubicacion',.t.)
llok = CargarTabla('leon','FuerzaVta')
llok = CargarTabla('leon','CateCtacte')
llok = CargarTabla('leon','Ctacte')
llok = CargarTabla('leon','PlanCue')
SET SAFETY ON

IF !llok
	RETURN .f.
ENDIF

SET SAFETY ON
Oavisar.proceso('S','Abriendo archivos') 


USE ALLTRIM(lcpath )+"\gestion\seccion" IN 0 ALIAS CsrSeccion EXCLUSIVE 

USE  ALLTRIM(lcpath )+"\gestion\proveed" in 0 alias CsrAcreedor EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\articulo" in 0 alias CsrArticulo EXCLUSIVE	

USE ALLTRIM(lcpath )+"\gestion\marcas" in 0 alias CsrmarcaVie EXCLUSIVE

USE ALLTRIM(lcpath )+"\gestion\frios" in 0 alias CsrFrio EXCLUSIVE

USE ALLTRIM(lcpath )+"\gestion\noventa" IN 0 ALIAS CsrNoventa EXCLUSIVE

USE ALLTRIM(lcpath )+"\gestion\deposito" IN 0 ALIAS CsrdepositoVie EXCLUSIVE

USE ALLTRIM(lcpath )+"\gestion\sabor" IN 0 ALIAS CsrSabores EXCLUSIVE

USE  ALLTRIM(lcpath )+"\gestion\gamabase" in 0 alias CsrGama EXCLUSIVE

USE ALLTRIM(lcpath )+"\gestion\codbarra" in 0 alias CsrSubArticulo EXCLUSIVE

Oavisar.proceso('S','Procesando '+alias()) 

LOCAL lnid
*****
lnid = RecuperarID('CsrVariedad',Goapp.sucursal10)

SELECT CsrFuerzaVta
GO TOP 
lnidfuerzavta = CsrFuerzavta.id

SELECT CsrSabores
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
	lcnombre=NombreNi(alltrim(UPPER(CsrSabores.nombre)))
   	INSERT INTO CsrVariedad (id,numero,nombre,tag);
   	VALUES (lnid,CsrSabores.numero,lcnombre,"00000000")
   	lnid = lnid + 1

ENDSCAN

lnid = RecuperarID('CsrTipoFrio',Goapp.sucursal10)

SELECT CsrFrio
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
	IF delogico
    	LOOP 
    ENDIF 
	lcnombre=NombreNi(ALLTRIM(UPPER(CsrFrio.nombre)))

   INSERT INTO CsrTipoFrio (id,numero,nombre)  VALUES (lnid,CsrFrio.numero,lcnombre)
   lnid = lnid + 1
          
ENDSCAN

lnid = RecuperarID('CsrRubro',Goapp.sucursal10)

SELECT CsrSeccion
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
      
        lntipoprod = 1100000001 && IIF(Csrseccion.pideauto="S",2,1)
        lntipovta   = 1100000001 &&IIF(Csrseccion.clase="L",2,1)
        lnretibruto = 1 &&IIF(CsrSeccion.perceib="S",1,0)
        lnolista = IIF(CsrSeccion.estado='I',1,0)
        lnporcecomi = IIF(!EMPTY(STR(CsrSeccion.comision)),CsrSeccion.comision,0)
        lnporcedev = IIF(!EMPTY(STR(CsrSeccion.porcedev)),CsrSeccion.porcedev,0)
        lnporcesuge = IIF(!EMPTY(STR(CsrSeccion.porsuge)),CsrSeccion.porsuge,0) 
        lntasavied = IIF(!EMPTY(STR(CsrSeccion.tasa)),CsrSeccion.tasa,0)
        lntasapata = IIF(!EMPTY(STR(CsrSeccion.tasapata)),CsrSeccion.tasapata,0)
	   	lcnombre=NombreNi(ALLTRIM(UPPER(CsrSeccion.nombre)))
                             
       	INSERT INTO CsrRubro (id,numero,nombre,idtipoprod,idtipovta,perceibruto,idfuerzavta,nolista;
       					,porcecomi,porcesuge,porcedev,tasavied,tasapata) ;
       	VALUES (lnid,CsrSeccion.numero,lcnombre,lntipoprod,lntipovta,lnretibruto,lnidfuerzavta,lnolista;
       					,lnporcecomi,lnporcesuge,lnporcedev,lntasavied,lntasapata)
       	lnid = lnid + 1

ENDSCAN


lnid = RecuperarID('CsrMarca',Goapp.sucursal10)

SELECT CsrMarcaVie
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
    IF delogico
       LOOP 
    ENDIF 
 	lnporceflete = 0
 	lnporceflete2 = 0
  	lcnombre=NombreNi(ALLTRIM(UPPER(CsrMarcaVie.nombre)))
   
   	INSERT INTO Csrmarca (id,numero,nombre,flete,flete2,idfuerzavta);
   	VALUES (lnid,CsrMarcaVie.numero,lcnombre,lnporceflete,lnporceflete2,lnidfuerzavta)
   	lnid = lnid + 1
ENDSCAN


&&&&UBICACIONES
lnid = RecuperarID('CsrUbicacion',Goapp.sucursal10)

SELECT distinct VAL(Codigo_emb) as numero FROM CsrArticulo INTO CURSOR CsrUbicacionVie
SELECT CsrUbicacionVie
Oavisar.proceso('S','Procesando Ubicaciones') 
GO top
SCAN FOR !EOF()
	lcnumero = ALLTRIM(STR(CsrUbicacionVie.numero,5))
  	lcnombre= "UBICACIÓN "+RTRIM(STRzero(VAL(lcnumero),5,0))
   	INSERT INTO CsrUbicacion (id,numero,nombre)	VALUES (lnid,lcnumero,lcnombre)
   	lnid = lnid + 1
ENDSCAN

lnid = RecuperarID('CsrProducto',Goapp.sucursal10)

SELECT CsrArticulo
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
	SELECT CsrProducto
	LOCATE FOR numero=CsrArticulo.numero 
	IF numero=CsrArticulo.numero
		SELECT CsrArticulo
		LOOP 
	ENDIF
	lcnombre = NombreNi(alltrim(CsrArticulo.nombre))
	lnidctacte = 0
	lnidseccion = 0
	lnfrio = 0
	lnidmarca = 0
	lnidubicacion = 0
	
    SELECT CsrCtacte
    LOCATE FOR cnumero=LTRIM(STR(10000+Csrarticulo.proveedor))
    IF FOUND()
    	lnidctacte = Csrctacte.id
    ENDIF

    SELECT CsrRubro
    LOCATE FOR numero=Csrarticulo.seccion
    IF FOUND()
        lnidseccion = CsrRubro.id
    ENDIF
    
    SELECT CsrTipoFrio
    LOCATE FOR numero=Csrarticulo.frio
    IF FOUND()
        lnfrio = CsrTipoFrio.id
    ENDIF

    SELECT CsrMarca
    LOCATE FOR numero=Csrarticulo.marca
    IF FOUND()
       lnidmarca = CsrMarca.id
    ENDIF

	SELECT CsrUbicacion
	GO TOP 
	lnidubicacion = CsrUbicacion.id
	LOCATE FOR numero = ALLTRIM(STR(VAL(CsrArticulo.codigo_emb),5))
	IF FOUND()
		lnidubicacion = CsrUbicacion.id
	ENDIF 	
	
    lnfracciona = IIF(Csrarticulo.fraccion='S',1,0)
    lnidestado 	= IIF(empty(Csrarticulo.debaja),1,2)
    lnidiva     = VAL(STR(goapp.sucursal10+10)+strzero(IIF(Csrarticulo.tablaiva=1,2,1),8))
    lnnolista   = 0 && IIF(Csrarticulo.figlista="N",1,0)
    lnnofactu   = 0 &&IIF(Csrarticulo.nofactu,1,0)
    lnespromo 	= 0 &&IF(csrarticulo.escodboni="S",1,0)
    lnidtipovta = 1 &&UNIDADES=1 ,	BULTOS = 2.
    lnvtakilos	= IIF(CsrArticulo.kilos="K",1,0)
    lnsireparto	= IIF(EMPTY(CsrArticulo.sireparto),0,1)
   	lnidforma 	= VAL(STR(goapp.sucursal10+10)+strzero(1,8))  &&SIN CLASIFICAR
	lninterno	= IIF(ISNULL(CsrArticulo.interno),0.00,CsrArticulo.interno)

	ldfecha          = DATETIME(YEAR(DATE()),MONTH(DATE()),DAY(DATE()),0,0,0)
	IF EMPTY(Csrarticulo.fechaulcpr)
		ldfechaulcpr 	= ldfecha
	ELSE       
		ldfechaulcpr = DATETIME(YEAR(Csrarticulo.fechaulcpr),MONTH(Csrarticulo.fechaulcpr),DAY(Csrarticulo.fechaulcpr),0,0,0)
	ENDIF 		
	IF EMPTY(Csrarticulo.fechapre)
		ldfechamodf 	= ldfecha
	ELSE       
		ldfechamodf = DATETIME(YEAR(Csrarticulo.fechapre),MONTH(Csrarticulo.fechapre),DAY(Csrarticulo.fechapre),0,0,0)
	ENDIF 		
	IF EMPTY(Csrarticulo.fechabon)
		ldfechabonif	= GOMONTH(ldfecha,360*20)
	ELSE       
		ldfechabonif = DATETIME(YEAR(Csrarticulo.fechabon),MONTH(Csrarticulo.fechabon),DAY(Csrarticulo.fechabon),0,0,0)
	ENDIF 	
	lnCosto	  = CsrArticulo.costo	
	lnFelte   = 0
	lnBonif1  = CsrArticulo.bonifica
	lnBonif2  = CsrArticulo.bonif2
	lnBonif3  = CsrArticulo.bonif3
	lnBonif4  = CsrArticulo.bonif4
	
	lnCostoBon	= lnCosto * (100 - lnBonif1)/100
	lnCostoBon	= lnCostoBon * (100 - lnBonif2)/100
	lnCostoBon	= lnCostoBon * (100 - lnBonif3)/100
	lnCostoBon	= lnCostoBon * (100 - lnBonif4)/100
	
	lnFlete	  = ROUND(lnCostoBon * (CsrArticulo.flete/100),2)
	
	lnprevta1 = Csrarticulo.PREVenta1
	lnprevta2 = Csrarticulo.PREVe2
	lnprevta3 = Csrarticulo.PREVe3
	lnsugerido= Csrarticulo.PREVe4

	lnprevtaf1 = Csrarticulo.PREVENTA1 * 1.21
	lnprevtaf2 = Csrarticulo.PREVE2 * 1.21
	lnprevtaf3 = Csrarticulo.PREVE3 * 1.21
	
	lnidctacpra = 0
	lnidctavta = 0
	SELECT CsrPlanCue
	LOCATE FOR nombre = "COMPRA DE MERCADERIA VARIA"
	IF FOUND()
		lnidctacpra = CsrPlanCue.id
	ENDIF
	SELECT CsrPlanCue
	LOCATE FOR nombre = "VENTA DE MERCADERIA VARIA"
	IF FOUND()
		lnidctavta = CsrPlanCue.id
	ENDIF 
	*Guardamos el numero de CsrArticulo.envase que es una referencia a CsrAticulo.numero del envase
	*Una vez caragdo todos los productos, recorremos los que idenvase#0 y buscamos el articulo = envase.
	lnidenvase = VAL(CsrArticulo.envase)
						
	INSERT INTO Csrproducto (id,NUMERO,NOMBRE,CODALFA,IDIVA,COSTO,MARGEN1,PREVTA1,MARGEN2,; 
	PREVTA2,SWITCH,idunidad,idtprod,idtamano,idcatego,idubicacio,idorigen,incluirped,idctacte,idrubro,MARGEN3,;
	PREVTA3,margen4,prevta4,interno,unibulto,peso,idtipovta,idforma,fracciona,nomodifica,nombulto,puntope,;
	idmoneda,incluirped,flete,feculcpra,fecalta,fecmodi,feculvta,bonif1,bonif2,bonif3,bonif4,idmarca,segflete,idestado,;
	nolista,nofactura,minimofac,espromocion,prevtaf1,prevtaf2,prevtaf3,prevtaf4,idfrio,sugerido,idingbrutos,divisible,;
	codartprod,desc1,min1,desc2,min2,desc3,min3,vtakilos,fecoferta,internoporce,idctacpra,idctaVTA,idenvase); 	
	VALUES (lnid, Csrarticulo.NUMERO, lcnombre, LTRIM(STR(Csrarticulo.numero)), lnidiva, lnCosto,	;
	Csrarticulo.utilidad, lnPREVta1, Csrarticulo.util2, lnPREVta2, '00000', 1,1,1,1,lnidubicacion,1,1,lnidctacte, lnidseccion, Csrarticulo.util3, ;
	lnPREVta3, 0,0,lninterno, Csrarticulo.unibulto,Csrarticulo.peso, lnidtipovta,lnidforma,lnfracciona,0,'',Csrarticulo.puntope,;
	1,1,lnflete,	ldfechaulcpr, ldfecha, ldfechamodf, ldfecha, lnBonif1,lnbonif2, lnbonif3,;
	lnbonif4 ,lnidmarca,0, lnidestado	,lnnolista, lnnofactu,0,	lnespromo,lnprevtaf1,lnprevtaf2,lnprevtaf3,0,lnfrio,;
	lnsugerido,1,lnsireparto	,IIF(EMPTY(CsrArticulo.codigo_prv),' ',CsrArticulo.codigo_prv),CsrArticulo.bonies, CsrArticulo.minimo,;
	CsrArticulo.bonies2, CsrArticulo.minimo2, CsrArticulo.bonies3, CsrArticulo.minimo3,LNVTAKILOS,ldfechabonif,0,lnidctacpra,lnidctavta,lnidenvase)		
*!*		SELECT CsrProducto
*!*		APPEND BLANK
*!*		SCATTER NAME objProducto
*!*			objProducto.id = lnid
*!*			objProducto.NUMERO = Csrarticulo.NUMERO
*!*			objProducto.NOMBRE = Csrarticulo.NOMBRE
*!*			objProducto.CODALFA =  LTRIM(STR(Csrarticulo.numero))
*!*			objProducto.IDIVA = lnidiva
*!*			objProducto.COSTO = Csrarticulo.costo
*!*			objProducto.MARGEN1 = Csrarticulo.utilidad
*!*			objProducto.PREVTA1= lnPREVta1
*!*			objProducto.MARGEN2  =Csrarticulo.util2
*!*			objProducto.PREVTA2=lnPREVta2
*!*			objProducto.SWITCH = '00000'
*!*			objProducto.idunidad = 1
*!*			objProducto.idtprod = 1
*!*			objProducto.idtamano = 1
*!*			objProducto.idcatego = 1
*!*			objProducto.idubicacio = 1
*!*			objProducto.idorigen = 1
*!*			objProducto.incluirped = 1
*!*			objProducto.idctacte = lnidctacte
*!*			objProducto.idrubro = lnidseccion
*!*			objProducto.MARGEN3 = Csrarticulo.util3
*!*			objProducto.PREVTA3 = lnPREVta3
*!*			objProducto.margen4 = 0
*!*			objProducto.prevta4 = 0
*!*			objProducto.interno = lninterno
*!*			objProducto.unibulto = Csrarticulo.unibulto
*!*			objProducto.peso = Csrarticulo.peso
*!*			objProducto.idtipovta =  lnidtipovta
*!*			objProducto.idforma = lnidforma
*!*			objProducto.fracciona = lnfracciona
*!*			objProducto.nomodifica = 0
*!*			objProducto.nombulto = ''
*!*			objProducto.puntope = Csrarticulo.puntope
*!*			objProducto.idmoneda = 1
*!*			objProducto.incluirped = 1
*!*			objProducto.flete = Csrarticulo.flete
*!*			objProducto.feculcpra = ldfechaulcpr
*!*			objProducto.fecalta = ldfecha
*!*			objProducto.fecmodi = ldfechamodf
*!*			objProducto.feculvta = ldfecha
*!*			objProducto.bonif1 = Csrarticulo.bonif1
*!*			objProducto.bonif2 = Csrarticulo.bonif2
*!*			objProducto.bonif3 = Csrarticulo.bonif3
*!*			objProducto.bonif4 = Csrarticulo.bonif4
*!*			objProducto.idmarca = lnidmarca
*!*			objProducto.segflete = 0
*!*			objProducto.idestado = lnidestado
*!*			objProducto.nolista = lnnolista
*!*			objProducto.nofactura = lnnofactu
*!*			objProducto.minimofac = 0
*!*			objProducto.espromocion = lnespromo
*!*			objProducto.prevtaf1 = lnprevtaf1
*!*			objProducto.prevtaf2 = lnprevtaf2
*!*			objProducto.prevtaf3 = lnprevtaf3
*!*			objProducto.prevtaf4 = 0
*!*			objProducto.idfrio = lnfrio
*!*			objProducto.sugerido = lnsugerido
*!*			objProducto.idingbrutos = 1
*!*			objProducto.divisible = lnsireparto
*!*			objProducto.codartprod = IIF(EMPTY(CsrArticulo.codigo_prv),' ',CsrArticulo.codigo_prv)
*!*			objProducto.desc1 = CsrArticulo.bonies
*!*			objProducto.min1 = CsrArticulo.minimo
*!*			objProducto.desc2 = CsrArticulo.bonies2
*!*			objProducto.min2 = CsrArticulo.minimo2
*!*			objProducto.desc3 = CsrArticulo.bonies3
*!*			objProducto.min3 = CsrArticulo.minimo3
*!*			objProducto.vtakilos = LNVTAKILOS
*!*			objProducto.fecoferta = ldfechabonif
*!*		GATHER NAME ObjProducto
*!*		SELECT CsrProducto
	lnid = lnid + 1

	 SELECT CsrArticulo   				
ENDSCAN

***Buscamos los productos que son envases
SELECT CsrEnvase.* FROM CsrProducto as CsrEnvase WHERE CsrEnvase.numero in (SELECT CsrProducto.idenvase FROM CsrProducto WHERE idenvase#0 );
INTO CURSOR CsrEnvase READWRITE 

SELECT CsrProducto
GO TOP 
SCAN 
	IF idenvase=0
		LOOP 
	ENDIF 
	SELECT CsrEnvase
	LOCATE FOR numero = CsrProducto.idenvase
	lnidenvase = 0
	IF numero = CsrProducto.idenvase
		lnidenvase = CsrEnvase.id
	ENDIF 
	replace idenvase WITH lnidenvase IN CsrProducto
ENDSCAN  

lnid = RecuperarID('CsrDeposito',Goapp.sucursal10)

SELECT CsrDepositoVie
Oavisar.proceso('S','Procesando '+alias()) 
GO top
SCAN FOR !EOF()
   	lcnombre=NombreNi(ALLTRIM(UPPER(CsrDepositovie.nombre)))
	INSERT INTO Csrdeposito (id,numero,nombre,llevastock);
	VALUES (lnid,Csrdepositovie.numero,lcnombre,1)
	lnid = lnid + 1

ENDSCAN

LOCAL lnidsub,lnidblo
lnidsub = RecuperarID('CsrSubProducto',Goapp.sucursal10)
lnidblo = RecuperarID('CsrBloqueoProd',Goapp.sucursal10)

		
SELECT distinct numero,sabor FROM CsrSubArticulo WHERE sabor<>0 INTO CURSOR 'CsrAux2' ORDER BY numero, sabor
SELECT CsrSubproducto
Oavisar.proceso('S','Procesando '+alias())
SELECT CsrAux2
SCAN
	SELECT CsrProducto
	LOCATE FOR numero = CsrAux2.numero
	IF FOUND() AND numero = CsrAux2.numero
		lnidart=CsrProducto.id
		lnnum=CsrProducto.numero
		SELECT CsrVariedad
		LOCATE FOR numero = CsrAux2.sabor
		IF FOUND()
			lnidvari=CsrVariedad.id
			lnsubnum=CsrVariedad.numero
			lcnom=CsrVariedad.nombre
			
			INSERT INTO SubProducto (id,idarticulo,numero,subnumero,idvariedad,nombre,codigo,troquel,nofactura,estado);
			VALUES (lnidsub,lnidart,lnnum,lnsubnum,lnidvari,lcnom,"0","00000000",0,0)
			
			lnidsub=lnidsub+1
			*lnidsubs = VAL(STR(Goapp.sucursal10 + 10,2)+LTRIM(STR(lnidsub)))
		ENDIF
		
	ENDIF
	SELECT Csraux2
	
ENDSCAN
SELECT CsrNoventa
Oavisar.proceso('S','Procesando '+alias())
SCAN
	&& busco la ctacte y el articulo
	SELECT CsrCtacte 
	LOCATE FOR VAL(cnumero) = CsrNoventa.Cliente
	IF FOUND()
		lnidctacte = CsrCtacte.id
		SELECT CsrProducto
		LOCATE FOR numero = CsrNoventa.articulo
		IF FOUND()
			lnidarticulo = CsrProducto.id
			IF CsrNoventa.sabor#0
				SELECT csrVariedad
				LOCATE FOR numero = CsrNoventa.sabor
				IF FOUND()
					SELECT CsrSubproducto
					LOCATE FOR idarticulo = csrProducto.id AND idvariedad = CsrVariedad.id
					IF FOUND()
						lnidsubarti = CsrSubproducto.id
					ELSE
						lnidsubarti = 0
					ENDIF 
				ENDIF 
			ELSE
				lnidsubarti = 0
			ENDIF 
			&& guardo el dato
			INSERT INTO CsrBloqueoProd (id,idarticulo,idsubarti,idctacte);
			VALUES (lnidblo,lnidarticulo,lnidsubarti,lnidctacte)
			lnidblo=lnidblo+1
		ENDIF 
	ENDIF 
	SELECT CsrNoVenta
ENDSCAN

SELECT CsrCateCtacte

lnid = RecuperarID('CsrGamaBase',Goapp.sucursal10)

SELECT CsrGama
SCAN 
	 SELECT CsrProducto
	 LOCATE FOR numero = CsrGama.articulo
	 IF !(numero = CsrGama.articulo)
	 	LOOP 
	 ENDIF 
	 SELECT CsrCatectacte
	 LOCATE FOR numero = CsrGama.categoria
	 IF !(numero = CsrGama.categoria)
	 	LOOP 
	 ENDIF 
	 SELECT CsrVariedad
	 lnidsub = 0
	 LOCATE FOR numero = CsrGama.sabor
	 IF !(numero = CsrGama.sabor) AND CsrGama.sabor<>0
	 	LOOP 
	 ELSE
	 	SELECT CsrSubproducto
	 	LOCATE FOR idarticulo=CsrProducto.id  AND idvariedad = CsrVariedad.id
	 	IF idarticulo=CsrProducto.id  AND idvariedad = CsrVariedad.id 
	 		lnidsub = CsrSubproducto.id
	 	ELSE
	 		LOOP 
	 	ENDIF 
	 ENDIF    
	 INSERT INTO CsrGamabase(id,idcatectacte,idproducto,idsubproducto);
	 VALUES (lnid,CsrCatectacte.id,CsrProducto.id,lnidsub)
	 lnid = lnid + 1	                                          
ENDSCAN 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
	
USE IN  CsrSeccion 
USE  IN  CsrAcreedor 
USE IN  CsrArticulo 
USE in CsrmarcaVie 
USE in CsrFrio 
USE IN CsrNoventa 
USE IN CsrdepositoVie 
USE in CsrSabores 
USE  in CsrGama 
USE  IN CsrSubArticulo 
