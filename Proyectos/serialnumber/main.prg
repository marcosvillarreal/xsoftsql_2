SET PROCEDURE TO procdesarrollo.prg ADDITIVE 
SET CLASSLIB  TO  controles ADDITIVE 

PUBLIC OAvisar
Oavisar=CREATEOBJECT('avisar')

*!*	objWMI = Getobject("winmgmts:\\")

*!*	cCadWMI = "Select * from Win32_PhysicalMedia"

*!*	oSistema = objWMI.ExecQuery(cCadWMI)


*!*	stop()
*!*	For Each Disco In oSistema

*!*	     MESSAGEBOX("Serial de fabrica :" + Disco.SerialNumber,0)

*!*	Next

*
#DEFINE wbemFlagReturnImmediately 0x10
#DEFINE wbemFlagForwardOnly 0x20
*
LOCAL llError
*
ON ERROR llError = .F.
*
LOCAL loWMIService, loColumnas, loItem
LOCAL lcNameSpace, lcWQL, lcPC
*
STORE .NULL. TO loWMIService, loColumnas, loItem && Variables locales.
STORE SPACE( 0 ) TO lcWQL &&Sentencia SQL (WQL).
*
loWMIService = GETOBJECT("winmgmts:\\" ) 
*
lcWQL = "SELECT * FROM Win32_PhysicalMedia"
*
loColumnas = loWMIService.ExecQuery( lcWQL, "WQL", wbemFlagReturnImmediately + wbemFlagForwardOnly)
*

cSerialNumber = ""
FOR EACH loItem IN loColumnas
	IF 'PHYSICALDRIVE0'$loItem.Tag
		cSerialNumber = loItem.SerialNumber
	ENDIF 
ENDFOR
*
RELEASE loWMIService, loColumnas, loItem

oavisar.usuario("N� Serie Disco: "+cSerialNumber)