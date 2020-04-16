FUNCTION DataCursor
PARAMETERS cName

DO CASE
CASE UPPER(RTRIM(cName)) = "CONEXION"
	CREATE CURSOR Conexion (id i, codigo i, aliasconexion c(30), servername c(60), initcatalogo c(60),origendata c(10);
		,sourcetype c(10), username c(20), pwdname c(20), webservice c(60), pathdatabase c(60);
		,pwdlen n(2), userlen n(2), idservpedido c(10), passpedido c(50), pmabrevia c(5),switch c(5);
		,emprename c(20), emprepass c(20), euserlen n(2), epwdlen n(2))
case upper(rtrim(cName)) = "PARAVARIO"
	CREATE CURSOR ParaVario (id i, idorigen i, nombre c(30), importe n(14), porce n(8), detalle c(30);
		,fecha d, estado n(1))
OTHERWISE
	RETURN .f.
ENDCASE
RETURN .t.