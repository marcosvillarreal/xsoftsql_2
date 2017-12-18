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
llok = CargarTabla(lcData,'CateCtacte',.t.)
llok = CargarTabla(lcData,'Barrio',.t.)
llok = CargarTabla(lcData,'PlanCue')
llok = CargarTabla(lcData,'Sucursal',.t.)

TEXT TO lcCmd TEXTMERGE NOSHOW 
SELECT CsrLocalidad.* FROM Localidad as CsrLocalidad
ENDTEXT 
=CrearCursorAdapter('CsrLocalidad',lcCmd)

SET SAFETY ON
CREATE CURSOR CsrLista (deta01 c(250),deta02 c(250),deta03 c(250) )
		
Oavisar.proceso('S','Abriendo archivos') 

SELECT CsrLista
cArchivo = ALLTRIM(lcpath )+"\clientes.txt"
APPEND FROM  &cArchivo SDF

lcDelimitador = ";"
replace ALL deta01 WITH STRTRAN(deta01,"	",lcDelimitador)
replace ALL deta02 WITH STRTRAN(deta02,"	",lcDelimitador)
replace ALL deta03 WITH STRTRAN(deta03,"	",lcDelimitador)

Oavisar.proceso('S','Procesando '+alias()) 

lnid = RecuperarID('CsrCatectacte',Goapp.sucursal10)
lnnumero = 1
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'CLIENTES',0,0,0,'00000')
lnid = lnid +1 
lnnumero = lnnumero + 1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'CTA CTE BANCO',0,0,0,'00000')
lnid = lnid +1 
lnnumero = lnnumero + 1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'CTA CTE PROVEEDOR',0,0,0,'01000')
lnid = lnid +1 
lnnumero = lnnumero + 1 
INSERT INTO CsrCateCtacte (id,numero,nombre,tasa1,tasa2,tasa3,switch) VALUES (lnid,lnnumero,'CTA CTE SERVICIO',0,0,0,'00000')

lnid = RecuperarID('CsrCtacte',Goapp.sucursal10)

cCadeCtacte = "" 


SELECT CsrLista
GO TOP 
vista()
lnPrimeraOcurrencia = 1
leiunarticulo = .f.

stop()
SCAN 
	lnCantCampo = 29 &&Hay un campo vacio
	lnSiguienteOcurrencia = 1
	lnCamposLeidos = 1 &&Campos de CsrLista
	lcNomCampo = "CsrLista.deta"+strzero(lnCamposLeidos,2)
*!*		*Recupero el Rubro
*!*		IF AT(lcDelimitador,deta01,1)=1 AND AT(lcDelimitador,deta01,2)<>2 AND LEN(LTRIM(SUBSTR(deta01,2,AT(lcDelimitador,deta01,2)-2)))#0
*!*			lninicio = 2
*!*			lnpos = AT(lcDelimitador,deta01,2)
*!*			lcRubro = LimpiarCadena(SUBSTR(deta01,lninicio,lnpos-lninicio))
*!*		ENDIF 
*!*		*Recupero la Familia
*!*		IF AT(lcDelimitador,deta01,1)=1 AND AT(lcDelimitador,deta01,2)<>2 AND LEN(LTRIM(SUBSTR(deta01,2,AT(lcDelimitador,deta01,2)-2)))=0
*!*			lninicio = AT(lcDelimitador,deta01,2) +1
*!*			lnpos = AT(lcDelimitador,deta01,3)
*!*			lcFamilia = LimpiarCadena(SUBSTR(deta01,lninicio,lnpos-lninicio))
*!*		ENDIF 
	IF AT(lcDelimitador,deta01)=1 AND (AT(lcDelimitador,deta01,2)=AT(lcDelimitador,deta01)+1 OR AT(lcDelimitador,deta01,3)=AT(lcDelimitador,deta01,2)+1)
		LOOP 
	ENDIF 
	
	IF AT(lcDelimitador,deta01)=lnPrimeraOcurrencia
		leiunarticulo = .t.
		STORE "" TO lcAcarreo
		STORE "" TO lcCodigo,lcCategoria,lcNombre,lcDireccion,LcLocalidad,lcCodPostal,lcProvincia
		STORE "" TO lcTelefono,lcTelefono2,lcFax,lcCelular,lcEmail,lcfecAlta,lcTipoDoc,lcDocumento
		STORE "" TO lcTipoIVA,lcVendedor,lcZona
		
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
			lcCategoria		= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcCategoria)))
			lcNombre		= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcNombre)))
			lcDireccion		= UPPER(LimpiarCadena(IIF(j + i=5,lcCadena,lcDireccion)))
			LcLocalidad		= UPPER(LimpiarCadena(IIF(j + i=6,lcCadena,lcLocalidad)))
			lcCodPostal		= UPPER(LimpiarCadena(IIF(j + i=7,lcCadena,lcCodPostal)))
			lcProvincia		= UPPER(LimpiarCadena(IIF(j + i=8,lcCadena,lcProvincia)))
			lcTelefono		= UPPER(LimpiarCadena(IIF(j + i=10,lcCadena,lcTelefono)))
			lcTelefono2		= UPPER(LimpiarCadena(IIF(j + i=11,lcCadena,lcTelefono2)))
			lcFax			= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcFax)))
			lcCelular		= UPPER(LimpiarCadena(IIF(j + i=13,lcCadena,lcCelular)))
			lcEmail			= UPPER(LimpiarCadena(IIF(j + i=14,lcCadena,lcEmail)))
			lcfecAlta		= IIF(j + i=19,DTOC(CDateEngSpa(lcCadena)),lcFecAlta)
			lcTipoDoc		= UPPER(LimpiarCadena(IIF(j + i=22,lcCadena,lcTipoDoc)))
			lcDocumento		= UPPER(LimpiarCadena(IIF(j + i=23,lcCadena,lcDocumento)))
			lcTipoIVA		= UPPER(LimpiarCadena(IIF(j + i=25,lcCadena,lcTipoIVA)))
			lcVendedor		= UPPER(LimpiarCadena(IIF(j + i=28,lcCadena,lcVendedor)))
			lcZona			= UPPER(LimpiarCadena(IIF(j + i=29,lcCadena,lcZona)))
					
			
			
*!*				lcfecha			= IIF(j + i=10,DTOC(CDateEngSpa(lcCadena)),lcFecha)
*!*				lcTipo			= UPPER(LimpiarCadena(IIF(j + i=6,lcCadena,lcTipo)))
*!*				lcModelo		= UPPER(LimpiarCadena(IIF(j + i=2,lcCadena,lcModelo)))
*!*				lcMarca			= UPPER(LimpiarCadena(IIF(j + i=3,lcCadena,lcMarca)))
*!*				lmDescripcion 	= UPPER(LimpiarCadena(IIF(j + i=8,lcCadena,lmDescripcion)))
*!*				lcObservaciones = UPPER(LimpiarCadena(IIF(j + i=11,lcCadena,lcObservaciones)))
*!*				lcRubro			= UPPER(LimpiarCadena(IIF(j + i=4,lcCadena,lcRubro)))
*!*				lcFamilia		= UPPER(LimpiarCadena(IIF(j + i=5,lcCadena,lcFamilia)))
*!*				lcEmail			= UPPER(LimpiarCadena(IIF(j + i=9,lcCadena,lcEmail)))
*!*				lcComentario	= UPPER(LimpiarCadena(IIF(j + i=12,lcCadena,lcComentario)))
			
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
		
		INSERT INTO FsrArticulo (fecha,tipo,articulo,marca,observa,rubro,familia,comentario,email);
		VALUES (lcfecha,lcTipo,lcModelo,lcMarca,lcObservaciones,lcrubro,lcFamilia,lcComentario,lcEmail)
		
		replace descripcion WITH lmDescripcion IN FsrArticulo
		leiunarticulo = .f.
	ENDIF 
ENDSCAN 

*!*	*!*	*!*	SELECT CsrDeudor
*!*	*!*	*!*	Oavisar.proceso('S','Procesando '+alias()) 
*!*	*!*	*!*	GO TOP
*!*	*!*	*!*	*stop()
*!*	*!*	*!*	SCAN 
*!*	*!*	*!*	 	SELECT CsrCtacte
*!*	*!*	*!*	 	LOCATE FOR VAL(cnumero) = VAL(CsrDeudor.codigo)
*!*	*!*	*!*	 	IF VAL(cnumero) = VAL(CsrDeudor.codigo)
*!*	*!*	*!*	 		cCadeCtacte = LTRIM(cCadeCtacte) + IIF(LEN(LTRIM(cCadeCtacte)) != 0,",","") + ltrim(CsrDeudor.codigo)
*!*	*!*	*!*	 		SELECT CsrDeudor
*!*	*!*	*!*	 		LOOP 
*!*	*!*	*!*	 		
*!*	*!*	*!*	 	ENDIF 
*!*	*!*	*!*	 	SELECT CsrDeudor 
*!*	*!*	*!*	 	STORE 0 TO lnidestado, 	lnctadeudor ,	lnctaacreedor, 	lnctabanco,	lnctaotro, 	lndctalogistica;
*!*	*!*	*!*	 			,lnidcateibrng ,lncomision ,lnidlocalidad ,lnidprovincia ,lntipoiva ,lnidcategoria;
*!*	*!*	*!*				,lnidplanpago ,lnidcanalvta ,lnsaldoAuto ,lnlista ,lncomision ,lnconvenio,lndctalogistica
*!*	*!*	*!*		
*!*	*!*	*!*	 	STORE 1100000001 TO lnidbarrio, lnidcategoria, lnlista
*!*	*!*	*!*	 	STORE "" TO lcCuit,lcDNI,lcingbrutos,lcingbrutosBA
*!*	*!*	*!*	 	STORE DATETIME(1900,01,01,0,0,0) TO ldfechac,ldfecultcompra,ldfecultpago,lcfefin
*!*	*!*	*!*	 		
*!*	*!*	*!*	 	lnctadeudor		= 1
*!*	*!*	*!*	 	lnidplanpago	= 1100000002 &&Por el momento todos de cuenta corriente		
*!*	*!*	*!*		lnidcanalvta	= 1100000006
*!*	*!*	*!*		
*!*	*!*	*!*		lcingbrutosBA = CsrDeudor.ingbrutos
*!*	*!*	*!*		
*!*	*!*	*!*		lcNroDoc		= strtrim(VAL(PeloCuit(CsrDeudor.NroDoc)),15)
*!*	*!*	*!*		IF CsrDeudor.tipodoc$'01-02'
*!*	*!*	*!*			lcCuit			= Cuit(lcNroDoc)
*!*	*!*	*!*		ELSE
*!*	*!*	*!*			lcDNI			= LEFT(RIGHT(lcNroDoc,8),2)+"."+LEFT(RIGHT(lcNroDoc,6),3)+"."+RIGHT(lcNroDoc,3)
*!*	*!*	*!*		ENDIF 
*!*	*!*	*!*		
*!*	*!*	*!*		&&Localidad
*!*	*!*	*!*		lnidlocalidad	= 1100000006 
*!*	*!*	*!*		*lcLocalidadBuscada = Ciudades(ALLTRIM(UPPER(CsrDeudor.Localidad)))
*!*	*!*	*!*		lnPostal		= VAL(CsrDeudor.Postal)
*!*	*!*	*!*		DO CASE
*!*	*!*	*!*		CASE lnPostal = 1727
*!*	*!*	*!*			lnidlocalidad	= 1100002059 &&MARCOS PAZ
*!*	*!*	*!*		CASE lnPostal = 8109
*!*	*!*	*!*			lnidlocalidad	= 1100002314 &&PUNTA ALTA
*!*	*!*	*!*		CASE lnPostal = 8105
*!*	*!*	*!*			lnidlocalidad	= 1100001422 &&GRAL CERRI
*!*	*!*	*!*		CASE lnPostal = 8103
*!*	*!*	*!*			lnidlocalidad	= 1100001557 &&ING WHITE
*!*	*!*	*!*		CASE lnPostal = 8129
*!*	*!*	*!*			lnidlocalidad	= 1100001374 &&FELIPE SOLA
*!*	*!*	*!*		CASE lnPostal = 8132
*!*	*!*	*!*			lnidlocalidad	= 1100002093 &&MEDANOS
*!*	*!*	*!*		CASE lnPostal = 8142
*!*	*!*	*!*			lnidlocalidad	= 1100001523 &&H. ASCASUBI
*!*	*!*	*!*		CASE lnPostal = 8146
*!*	*!*	*!*			lnidlocalidad	= 1100002085 &&BURATOVICH
*!*	*!*	*!*		CASE lnPostal = 8148
*!*	*!*	*!*			lnidlocalidad	= 1100002226 &&PEDRO LURO	
*!*	*!*	*!*		CASE lnPostal = 8150
*!*	*!*	*!*			lnidlocalidad	= 1100001102 &&DORREGO
*!*	*!*	*!*		CASE lnPostal = 8153
*!*	*!*	*!*			lnidlocalidad	= 1100002120 &&M. HERMOSO
*!*	*!*	*!*		CASE lnPostal = 8160
*!*	*!*	*!*			lnidlocalidad	= 1100002602 &&TORNQUIST	
*!*	*!*	*!*		CASE lnPostal = 8170
*!*	*!*	*!*			lnidlocalidad	= 1100002245 &&PIGUE
*!*	*!*	*!*		CASE lnPostal = 8174
*!*	*!*	*!*			lnidlocalidad	= 1100002419 &&SAAVEDRA
*!*	*!*	*!*		CASE lnPostal = 8183
*!*	*!*	*!*			lnidlocalidad	= 1100001146 &&DARREGUIERA
*!*	*!*	*!*		CASE lnPostal = 8512
*!*	*!*	*!*			lnidlocalidad	= 1100002777 &&VILLALONGA
*!*	*!*	*!*		CASE lnPostal = 8000
*!*	*!*	*!*			lnidlocalidad	=1100000345 &&BAHIA BLANCA
*!*	*!*	*!*		OTHERWISE
*!*	*!*	*!*			SELECT CsrLocalidad
*!*	*!*	*!*			LOCATE FOR VAL(cpostal) = lnpostal
*!*	*!*	*!*			lnidlocalidad = CsrLocalidad.id
*!*	*!*	*!*		ENDCASE
*!*	*!*	*!*		SELECT CsrLocalidad
*!*	*!*	*!*		LOCATE FOR id = lnidlocalidad
*!*	*!*	*!*		IF id = lnidlocalidad
*!*	*!*	*!*			lnidprovincia = CsrLocalidad.idprovincia
*!*	*!*	*!*			lccp = CsrLocalidad.cpostal
*!*	*!*	*!*		ENDIF
*!*	*!*	*!*		
*!*	*!*	*!*		&&TresPImp		
*!*	*!*	*!*		lntipoiva = VAL(CsrDeudor.tipo)
*!*	*!*	*!*		DO CASE 
*!*	*!*	*!*		CASE lntipoiva = 1
*!*	*!*	*!*			lntipoiva = 1	&&RI
*!*	*!*	*!*		CASE lntipoiva = 5
*!*	*!*	*!*			lntipoiva = 3	&&CF
*!*	*!*	*!*		CASE lntipoiva = 7
*!*	*!*	*!*			lntipoiva = 5	&&RM
*!*	*!*	*!*		CASE lntipoiva = 3
*!*	*!*	*!*			lntipoiva = 4	&&EXENTO
*!*	*!*	*!*		OTHERWISE 
*!*	*!*	*!*			lntipoiva = 7	&&NOCATEGORIZADO
*!*	*!*	*!*		ENDCASE 
*!*	*!*	*!*		IF lntipoiva=3
*!*	*!*	*!*			lcCuit=''
*!*	*!*	*!*		ENDIF

*!*	*!*	*!*	    DO CASE 
*!*	*!*	*!*	    CASE lnlista = VAL(CsrDeudor.Lista)
*!*	*!*	*!*	    	lnlista	= 1100000005
*!*	*!*	*!*	    CASE lnlista = VAL(CsrDeudor.Lista)
*!*	*!*	*!*	    	lnlista	= 1100000006
*!*	*!*	*!*	    ENDCASE 

*!*	*!*	*!*		lcnombre	= NombreNi(ALLTRIM(UPPER(CsrDeudor.nombre)))
*!*	*!*	*!*	  	lcnumero	= strtrim(VAL(CsrDeudor.codigo),8)
*!*	*!*	*!*	  	lcDireccion	= UPPER(CsrDeudor.domicilio)
*!*	*!*	*!*	  	lcCP		= LTRIM(lcCp)
*!*	*!*	*!*	  	lcTelefono	= LTRIM(CsrDeudor.telefono)
*!*	*!*	*!*	  	lcFax		= LTRIM(CsrDeudor.fax)
*!*	*!*	*!*	  	lnSaldoAuto	= CsrDeudor.limcrcli
*!*	*!*	*!*	  	ldfechac	= CsrDeudor.fechaini
*!*	*!*	*!*	  	lnBonif1	= CsrDeudor.bonifcli
*!*	*!*	*!*	  	lcEmail		= LTRIM(CsrDeudor.email)
*!*	*!*	*!*	  	lcObserva	= LTRIM(CsrDeudor.obsercli)
*!*	*!*	*!*	  	lcDatosFac	= LTRIM(CsrDeudor.contacli)
*!*	*!*	*!*	  		
*!*	*!*	*!*		INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
*!*	*!*	*!*		,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
*!*	*!*	*!*		,ctabanco,ctaotro,inscri01,fecins01,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
*!*	*!*	*!*		,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica,esrecodevol;
*!*	*!*	*!*		,totalizabonif,bonif1,fax,email,observa,cdatosfac,dni);
*!*	*!*	*!*		VALUES (lnid,lcNumero,lcnombre,lcDireccion,lccp;
*!*	*!*	*!*		,lnidlocalidad,lnidprovincia,lctelefono,lntipoiva,lccuit,lnidcategoria,0,0;
*!*	*!*	*!*		,lnidplanpago,lnidcanalvta,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
*!*	*!*	*!*		,"",lnsaldoAuto,ldfechac,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago;
*!*	*!*	*!*		,lnconvenio,lndctalogistica,0,0,lnBonif1,lcFax,lcEmail,lcObserva,lcDatosFac,lcDNI)

*!*	*!*	*!*		lnid = lnid + 1
*!*	*!*	*!*		
*!*	*!*	*!*		SELECT CsrDeudor           
*!*	*!*	*!*	ENDSCAN

*!*	*!*	*!*	IF LEN(LTRIM(cCadeCtacte)) != 0
*!*	*!*	*!*		=oavisar.usuario("No se grabaron algunas clientes, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
*!*	*!*	*!*	ENDIF 

*!*	*!*	*!*	SELECT CsrCtacte
*!*	*!*	*!*	GO BOTTOM 
*!*	*!*	*!*	lnCodProve = VAL(cnumero) + 1
*!*	*!*	*!*	SELECT CsrAcreedor
*!*	*!*	*!*	cCadeCtacte = "" 
*!*	*!*	*!*	Oavisar.proceso('S','Procesando '+alias()) 
*!*	*!*	*!*	GO  TOP 
*!*	*!*	*!*	SCAN 
*!*	*!*	*!*	 	STORE 0 TO lnidestado, 	lnctadeudor ,	lnctaacreedor, 	lnctabanco,	lnctaotro, 	lndctalogistica;
*!*	*!*	*!*	 			,lnidcateibrng ,lncomision ,lnidlocalidad ,lnidprovincia ,lntipoiva ,lnidcategoria;
*!*	*!*	*!*				,lnidplanpago ,lnidcanalvta ,lnsaldoAuto ,lnlista ,lncomision ,lnconvenio,lndctalogistica;
*!*	*!*	*!*				,lnlista
*!*	*!*	*!*		
*!*	*!*	*!*	 	STORE 1100000001 TO lnidbarrio, lnidcategoria
*!*	*!*	*!*	 	STORE "" TO lcCuit,lcDNI,lcingbrutos,lcingbrutosBA,lcDatosFac
*!*	*!*	*!*	 	STORE DATETIME(1900,01,01,0,0,0) TO ldfechac,ldfecultcompra,ldfecultpago,lcfefin
*!*	*!*	*!*	 		
*!*	*!*	*!*	 	lnctaacreedor	= 1
*!*	*!*	*!*	 	lnidplanpago	= 1100000002 &&Por el momento todos de cuenta corriente		
*!*	*!*	*!*		lnidcanalvta	= 1100000006
*!*	*!*	*!*		
*!*	*!*	*!*		lcingbrutosBA = CsrAcreedor.ing_brutos
*!*	*!*	*!*		
*!*	*!*	*!*		lcCuit			= Cuit(strtrim(VAL(PeloCuit(CsrAcreedor.cuit)),15))
*!*	*!*	*!*		
*!*	*!*	*!*		&&Localidad
*!*	*!*	*!*		lnidlocalidad	= 1100000006 
*!*	*!*	*!*		*lcLocalidadBuscada = Ciudades(ALLTRIM(UPPER(CsrDeudor.Localidad)))
*!*	*!*	*!*		lcPostal		= ALLTRIM(CsrDeudor.Postal)
*!*	*!*	*!*		DO CASE
*!*	*!*	*!*		CASE lcPostal	= '1607'
*!*	*!*	*!*			lnidlocalidad	= 1100002654 &&VILLA ADELINA
*!*	*!*	*!*		CASE lcPostal	= '1611'
*!*	*!*	*!*			lnidlocalidad	= 1100001183 &&DON TORCUATO                  
*!*	*!*	*!*		CASE lcPostal	= '1650'
*!*	*!*	*!*			lnidlocalidad	= 1100002485 &&SAN MARTIN                    
*!*	*!*	*!*		CASE lcPostal	= '1678'
*!*	*!*	*!*			lnidlocalidad	= 1100000962 &&CASEROS (PDO. 3 DE FEBRERO)   
*!*	*!*	*!*		CASE lcPostal	= '1727'
*!*	*!*	*!*			lnidlocalidad	= 1100002059 &&MARCOS PAZ                    
*!*	*!*	*!*		CASE lcPostal	= '1900'
*!*	*!*	*!*			lnidlocalidad	= 1100001820 &&LA PLATA                      
*!*	*!*	*!*		CASE lcPostal	= '2752'
*!*	*!*	*!*			lnidlocalidad	= 1100000940 &&CAPITAN SARMIENTO             
*!*	*!*	*!*		CASE lcPostal	= '5000'
*!*	*!*	*!*			lnidlocalidad	= 1100008167 &&CORDOBA
*!*	*!*	*!*		CASE lcPostal	= '6740'
*!*	*!*	*!*			lnidlocalidad	= 1100000984 &&CHACABUCO                     	
*!*	*!*	*!*		CASE '1708' $ lcPostal
*!*	*!*	*!*			lnidlocalidad	= 1100002127 &&MORON                         
*!*	*!*	*!*		CASE '1824' $ lcPostal
*!*	*!*	*!*			lnidlocalidad	= 1100001897 &&LANUS                         
*!*	*!*	*!*		CASE '1001' $ lcPostal
*!*	*!*	*!*			lnidlocalidad	= 1100002991 &&CIUDAD	
*!*	*!*	*!*		CASE '2300' $ lcPostal
*!*	*!*	*!*			lnidlocalidad	= 1100019029 &&RAFAELA
*!*	*!*	*!*		CASE '3002' $ lcPostal
*!*	*!*	*!*			lnidlocalidad	= 1100019118 &&SANTA FE
*!*	*!*	*!*		CASE lnPostal = 8000
*!*	*!*	*!*			lnidlocalidad	=1100000345 &&BAHIA BLANCA
*!*	*!*	*!*		OTHERWISE
*!*	*!*	*!*			SELECT CsrLocalidad
*!*	*!*	*!*			LOCATE FOR VAL(cpostal) = lnpostal
*!*	*!*	*!*			lnidlocalidad = CsrLocalidad.id
*!*	*!*	*!*		ENDCASE
*!*	*!*	*!*		SELECT CsrLocalidad
*!*	*!*	*!*		LOCATE FOR id = lnidlocalidad
*!*	*!*	*!*		IF id = lnidlocalidad
*!*	*!*	*!*			lnidprovincia = CsrLocalidad.idprovincia
*!*	*!*	*!*			lccp = CsrLocalidad.cpostal
*!*	*!*	*!*		ENDIF
*!*	*!*	*!*		
*!*	*!*	*!*		&&TresPImp		
*!*	*!*	*!*		lntipoiva = VAL(CsrAcreedor.tipo)
*!*	*!*	*!*		DO CASE 
*!*	*!*	*!*		CASE lntipoiva = 1
*!*	*!*	*!*			lntipoiva = 1	&&RI
*!*	*!*	*!*		CASE lntipoiva = 5
*!*	*!*	*!*			lntipoiva = 3	&&CF
*!*	*!*	*!*		CASE lntipoiva = 7
*!*	*!*	*!*			lntipoiva = 5	&&RM
*!*	*!*	*!*		CASE lntipoiva = 3
*!*	*!*	*!*			lntipoiva = 4	&&EXENTO
*!*	*!*	*!*		OTHERWISE 
*!*	*!*	*!*			lntipoiva = 7	&&NOCATEGORIZADO
*!*	*!*	*!*		ENDCASE 
*!*	*!*	*!*		IF lntipoiva=3
*!*	*!*	*!*			lcCuit=''
*!*	*!*	*!*		ENDIF


*!*	*!*	*!*		lcnombre	= NombreNi(ALLTRIM(UPPER(CsrAcreedor.nombre)))
*!*	*!*	*!*	  	lcnumero	= strtrim(lnCodProve,8)
*!*	*!*	*!*	  	lcDireccion	= UPPER(CsrAcreedor.domicilio)
*!*	*!*	*!*	  	lcCP		= LTRIM(lcCp)
*!*	*!*	*!*	  	lcTelefono	= LTRIM(CsrAcreedor.telefono)
*!*	*!*	*!*	  	lcFax		= LTRIM(CsrAcreedor.fax)
*!*	*!*	*!*	  	lnSaldoAuto	= CsrAcreedor.credito
*!*	*!*	*!*	  	lcEmail		= LTRIM(CsrAcreedor.email)
*!*	*!*	*!*	  	lcObserva	= LTRIM(CsrAcreedor.observaci)
*!*	*!*	*!*	  		
*!*	*!*	*!*		INSERT INTO CsrCtacte (id,CNUMERO,CNOMBRE,CDIRECCION,CPOSTAL,IDLOCALIDAD,IDPROVINCIA,CTELEFONO;
*!*	*!*	*!*		,TIPOIVA,CUIT,IDCATEGORIA,SALDO,SALDOANT,idplanpago,idcanalvta,estadocta,ctadeudor,ctaacreedor;
*!*	*!*	*!*		,ctabanco,ctaotro,inscri01,fecins01,inscri02,inscri03,saldoauto,fechalta,idbarrio,lista;
*!*	*!*	*!*		,idcateibrng,ingbrutos,comision,fecultcompra,fecultpago,convenio,ctalogistica,esrecodevol;
*!*	*!*	*!*		,totalizabonif,bonif1,fax,email,observa,cdatosfac);
*!*	*!*	*!*		VALUES (lnid,lcNumero,lcnombre,lcDireccion,lccp;
*!*	*!*	*!*		,lnidlocalidad,lnidprovincia,lctelefono,lntipoiva,lccuit,lnidcategoria,0,0;
*!*	*!*	*!*		,lnidplanpago,lnidcanalvta,lnidestado,lnctadeudor,lnctaacreedor,lnctabanco,lnctaotro,"",lcfefin,lcingbrutosBA;
*!*	*!*	*!*		,"",lnsaldoAuto,ldfechac,0,lnlista,lnidcateibrng,lcingbrutos,lncomision,ldfecultcompra,ldfecultpago;
*!*	*!*	*!*		,lnconvenio,lndctalogistica,0,0,lnBonif1,lcFax,lcEmail,lcObserva,lcDatosFac)

*!*	*!*	*!*		lnid = lnid + 1
*!*	*!*	*!*		lnCodProve = lnCodProve + 1 
*!*	*!*	*!*		
*!*	*!*	*!*		SELECT CsrAcreedor          
*!*	*!*	*!*	ENDSCAN

*!*	*!*	*!*	IF LEN(LTRIM(cCadeCtacte)) != 0
*!*	*!*	*!*		=oavisar.usuario("No se grabaron algunas proveedores, porque estan duplicados"+CHR(13)+cCadeCtacte,0)
*!*	*!*	*!*	ENDIF 

Oavisar.proceso('N') 
=MESSAGEBOX('Proceso terminado! ')

SELECT CsrCtacte
*vista()

CLOSE tables
CLOSE INDEXES
CLOSE DATABASES

