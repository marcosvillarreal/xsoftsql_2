
DO setup
SET PROCEDURE  TO  proc.prg ADDITIVE  && Procedimientos generales
SET PROCEDURE  TO  syserror.prg ADDITIVE  

CLOSE DATABASES
CLOSE TABLES
OPEN DATABASE ? EXCLUSIVE

SET SAFETY OFF

Oavisar.proceso('S','Vaciando archivos') 

SET CPCOMPILE TO 1252
codepage = 1252
SET CPDIALOG ON

SET DATABASE TO ALARCIA
USE ALARCIA!producto IN 0 ALIAS Csrproducto EXCLUSIVE

USE ALARCIA!Plancue IN 0 ALIAS CsrPlanCue EXCLUSIVE

USE ALARCIA!ProdCtaCon IN 0 ALIAS CsrProdCtaCon EXCLUSIVE
ZAP IN CsrProdCtaCon

SET SAFETY ON

lnidproducto=0
SELECT CsrProdCtaCon
IF RECCOUNT('CsrProdCtaCon')>0
	GO bottom
	lnidproducto=VAL(SUBSTR(ALLTRIM(STR(CsrProdCtaCon.id+1,10)),3))
ENDIF
lnidproducto =  VAL(STR(Goapp.sucursal10 + 10,2)+LTRIM(STRZERO(lnidproducto+1,8)))

SELECT CsrProducto

Oavisar.proceso('S','Procesando los productos con la cuenta contable') 
GO top
SCAN FOR !EOF()
	STORE 0 TO lnIdctavta,lnIdctacpra
	
	IF CsrProducto.id = 1100002015
		DEBUG
		SUSPEND 
	ENDIF 
	
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = CsrProducto.IdCtaVta
	IF cuenta = CsrProducto.IdCtaVta
		lnIdCtaVta = CsrPlancue.id
	ENDIF 
	SELECT CsrPlanCue 
	LOCATE FOR cuenta = CsrProducto.IdCtaCpra
	IF cuenta = CsrProducto.IdCtaCpra
		lnIdCtaCpra = CsrPlancue.id
	ENDIF 
	lnIdEjercicio = Goapp.idejercicio
	lnidarticulo = CsrProducto.id
	
   	INSERT INTO CsrProdCtaCon(id,idejercicio,idarticulo,idctavta,idctacpra);
    VALUES (lnIdProducto, lnidejercicio,lnidarticulo,lnidctavta,lnidctacpra)
    
    lnIdProducto = lnIdProducto +1  	
	
	replace IdCtaVta WITH 0, IdCtaCpra WITH 0 IN CsrProducto
	
	SELECT CsrProducto 				
ENDSCAN




Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')
CLOSE tables
CLOSE INDEXES
CLOSE DATABASES
	