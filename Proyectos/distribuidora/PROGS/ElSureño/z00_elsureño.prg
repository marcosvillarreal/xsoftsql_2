&&Fuentes de importacion de archivos de texto para elsure�o (Jaque Acces)
FUNCTION LeerClientes(cArchivo)

CREATE CURSOR CsrLista (deta01 c(250),deta02 c(250),deta03 c(250) )

CREATE CURSOR CsrDeudor (Codigo c(8),Categoria c(20),Nombre c(70),Direccion c(100),Localidad c(50);
		,CodPostal c(10),Provincia c(50);
		,Telefono c(20),Telefono2 c(20),Fax c(20),Celular c(20),Email c(50),fecAlta c(15);
		,TipoDoc c(50),Documento c(20);
		,TipoIVA c(50),Vendedor c(30),Zona c(3),obsercli c(100),ctadeudor n(1),IngBrutos c(20);
		,DireNro c(5),DirePiso c(5),DireDpto c(5),Lista c(30),CodLista n(2),Estado c(1);
		,CodCateIVA n(2),CodGan n(3),PlanPago n(1),DiasVto n(3),Ganancia n(1))
	
Oavisar.proceso('S','Abriendo archivos') 

SELECT CsrLista
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
lnPrimeraOcurrencia = 44
leiunarticulo = .f.

ldebug = .t.

*SKIP 
stop()
DO WHILE NOT EOF()
	lnCantCampo = 12 &&Hay un campo vacio
	lnSiguienteOcurrencia = 1
	lnCamposLeidos = 1 &&Campos de CsrLista
	lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)

	IF AT(lcDelimitador,deta01)=1 AND (AT(lcDelimitador,deta01,2)=AT(lcDelimitador,deta01)+1 OR AT(lcDelimitador,deta01,3)=AT(lcDelimitador,deta01,2)+1)
		SKIP 
		LOOP 
	ENDIF 
	
	IF AT(lcDelimitador,deta01)=lnPrimeraOcurrencia
		leiunarticulo = .t.
		STORE "" TO lcAcarreo
		STORE "" TO lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia
		STORE "" TO lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento
		STORE "" TO lcTipoIVA,lcVendedor,lcZona,lcCodVendedor,lcDireNro,lcDirePiso,lcDireDpto,lcLista
		STORE "" TO lcEstado,lcCodLista,lcCodCateIVA
		
		j = 0
	ELSE
		IF !leiunarticulo
			SKIP 
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
			lcIdJ			= UPPER(LimpiarCadena(IIF(j + i=1,lcCadena,lcIdJ)))
			lcCodigo		= UPPER(LimpiarCadena(IIF(j + i=19,lcCadena,lcCodigo)))
			lcNombre		= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcNombre)))
			lcDocumento		= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcDocumento)))
			lcDireccion		= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcDireccion)))
			lcDireNro		= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcDireNro)))
			*lcCodPostal		= UPPER(LimpiarCadena(IIF(j + i=5,lcCadena,lcCodPostal)))
			*lcDirePiso		= UPPER(LimpiarCadena(IIF(j + i=8,lcCadena,lcDirePiso)))
			*lcDireDpto		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcDireDpto)))
			LcLocalidad		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcLocalidad)))
			*lcProvincia		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcProvincia)))
			lcTelefono		= UPPER(LimpiarCadena(IIF(j + i=8,lcCadena,lcTelefono)))
			lcCodCateIVA	= UPPER(LimpiarCadena(IIF(j + i=9,lcCadena,lcCodCateIVA)))
			*lcTipoIVA		= UPPER(LimpiarCadena(IIF(j + i=15,lcCadena,lcTipoIVA)))
			*lcCategoria	= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcCategoria)))
			lcEstado		= UPPER(LimpiarCadena(IIF(j + i=19,lcCadena,lcEstado)))
			lcCodLista			= UPPER(LimpiarCadena(IIF(j + i=27,lcCadena,lcCodLista)))
			*lcLista			= UPPER(LimpiarCadena(IIF(j + i=19,lcCadena,lcLista)))
			*lcZona			= UPPER(LimpiarCadena(IIF(j + i=11,lcCadena,lcZona)))
			*lcCodVendedor	= UPPER(LimpiarCadena(IIF(j + i=9,lcCadena,lcCodVendedor)))
			lcVendedor		= UPPER(LimpiarCadena(IIF(j + i=29,lcCadena,lcVendedor)))
			
			*lcCodPostal		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcCodPostal)))
			*lcFax			= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcFax)))
			lcCelular		= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcCelular)))
			*lcEmail			= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcEmail)))
			*lcfecAlta		= IIF(j + i=19,lcCadena,lcFecAlta)
			lcTipoDoc		= 'CUIT'&&UPPER(LimpiarCadena(IIF(j + i=22,lcCadena,lcTipoDoc)))
			*lcZona			= UPPER(LimpiarCadena(IIF(j + i=29,lcCadena,lcZona)))
							
			lnSiguienteOcurrencia = lnPos + 1
			i = i + 1
			
			IF VAL(lcCodigo)=1772 and ldebug
				*stop()
				ldebug = .f.
			ENDIF 
		
		ENDDO 
		lnSiguienteOcurrencia = 13
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
		IF '*'$lcTelefono
			LOOP
		ENDIF 
		*lcCodigo = SUBSTR(lcCodigo,4)
		
		INSERT INTO CsrDeudor (Codigo,Categoria,Nombre,Direccion,Localidad,CodPostal,Provincia;
		,Telefono,Telefono2,Fax,Celular,Email,fecAlta,TipoDoc,Documento;
		,TipoIVA,Vendedor,Zona,ctadeudor,DireNro,DirePiso,DireDpto,Lista,Estado,CodLista;
		,CodCateIVA) ;
		values (lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia ;
		,lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento ;
		,lcTipoIVA,lcVendedor,lcZona,1,lcDireNro,lcDirePiso,lcDireDpto,lcLista,lcEstado;
		,VAL(lcCodLista),VAL(lcCodCateIVA))
				
		*replace descripcion WITH lmDescripcion IN FsrArticulo
		leiunarticulo = .f.
	ENDIF 
	SKIP IN CsrLista
ENDDO 



ENDFUNC 

&&Fuentes de importacion de archivos de texto para elsure�o (Jaque Acces)
FUNCTION LeerClientesXML(cArchivo)

CREATE CURSOR CsrLista (id c(20),r00 c(20), r01 c(20),r02 c(20),r03 c(20),r04 c(20),r05 c(20),r06 c(20);
			,r07 c(20),r08 c(20),r09 c(20),r10 c(20),r11 c(20),r12 c(20),r13 c(20),r14 c(20),r15 c(20);
			,r16 c(20),r17 c(20),r18 c(20),r19 c(20),r20 c(20),r21 c(20),r22 c(20),r23 c(20),r24 c(20);
			,r25 c(20),r26 c(20),r27 c(20),r28 c(20),r29 c(20),r30 c(20),r31 c(20),r32 c(20),r33 c(20);
			,r34 c(20),r35 c(20),r36 c(20),r37 c(20),r38 c(20),r39 c(20),r40 c(20),r41 c(20),r42 c(20);
			,r43 c(20),r44 c(20),r45 c(20) )

CREATE CURSOR CsrDeudor (Codigo c(8),Categoria c(20),Nombre c(70),Direccion c(100),Localidad c(50);
		,CodPostal c(10),Provincia c(50);
		,Telefono c(20),Telefono2 c(20),Fax c(20),Celular c(20),Email c(50),fecAlta c(15);
		,TipoDoc c(50),Documento c(20);
		,TipoIVA c(50),Vendedor c(30),Zona c(3),obsercli c(100),ctadeudor n(1),IngBrutos c(20);
		,DireNro c(5),DirePiso c(5),DireDpto c(5),Lista c(30),CodLista n(2),Estado c(1);
		,CodCateIVA n(2),CodGan n(3),PlanPago n(1),DiasVto n(3),Ganancia n(1))
	
Oavisar.proceso('S','Abriendo archivos') 

XMLTOCURSOR(cArchivo ,"CsrLista",512+8192)



ENDFUNC 