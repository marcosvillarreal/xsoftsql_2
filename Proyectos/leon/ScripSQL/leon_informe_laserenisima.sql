use leon
go
select maopera.numcomp,comprobante.cabrevia
,convert(char(10),cabecpra.fecha,105)
,cabecpra.cnombre
,cabecpra.total
,afectacte.importe as afectado,maopeafecta.numcomp
,comprobanteafe.cabrevia
,convert(char(10),movctacte.fecha,105),movctacte.total
 from maopera
left join cabecpra on maopera.id = cabecpra.idmaopera
LEFT JOIN COMPROBANTE on maopera.idcomproba = comprobante.id
inner join afectacte on maopera.id = afectacte.idmaoperad
left join maopera as maopeafecta on afectacte.idmaoperah = maopeafecta.id 
left join movctacte on maopeafecta.id = movctacte.idmaopera
LEFT JOIN COMPROBANTE as comprobanteafe on maopeafecta.idcomproba = comprobanteafe.id
where maopera.origen='CPR'and ((
--maopera.numcomp like 'A6156%1913184'
--or maopera.numcomp like 'A6156%2017550'
--or maopera.numcomp like 'A6157%0076'
--or maopera.numcomp like 'A6156%2351747'
--or maopera.numcomp like 'A6156%2385442'
--or maopera.numcomp like 'A6156%2661737'
--or maopera.numcomp like 'A6156%2676068'
--or maopera.numcomp like 'A6156%2823592'
--or maopera.numcomp like 'A6156%2975059'
--or maopera.numcomp like 'A6186%9119'
--or maopera.numcomp like 'A6186%001085'
--or maopera.numcomp like 'A6186%9443'
--or maopera.numcomp like 'A6162%00864'
--or maopera.numcomp like 'A6162%05849'
--or maopera.numcomp like 'A6156%3128129'
--or maopera.numcomp like 'A6156%3141754'
--or maopera.numcomp like 'A6141%0004'
-- maopera.numcomp like 'A6010%001878'
--or maopera.numcomp like 'A6010%001883'
--or maopera.numcomp like 'A6066%001001'
--or maopera.numcomp like 'A6010%001918'
--or maopera.numcomp like 'A6010%001923'
--or maopera.numcomp like 'A6068%00164'
--or maopera.numcomp like 'A6066%001038'
--or maopera.numcomp like 'A6066%001039'
--or maopera.numcomp like 'A6068%00171'
--or maopera.numcomp like 'A6066%001125'
--or maopera.numcomp like 'A6066%001135'
--or maopera.numcomp like 'A6068%001666'
--or maopera.numcomp like 'A6010%002153'
--or maopera.numcomp like 'A6010%002158'
--or maopera.numcomp like 'A6010%002164'
--or maopera.numcomp like 'A6010%002169'
--or maopera.numcomp like 'A6004%0897246'
----maopera.numcomp like 'A2004%02621'
----or maopera.numcomp like 'A2004%016428'
----or maopera.numcomp like 'A2004%019183'
----or maopera.numcomp like 'A2004%019768'
----or maopera.numcomp like 'A2004%021051'
----or maopera.numcomp like 'A2004%026327'
----or maopera.numcomp like 'A2004%048959'
----or maopera.numcomp like 'A2004%060011'
----or maopera.numcomp like 'A2004%065688'
----or maopera.numcomp like 'A2004%069390'
maopera.numcomp like 'A2066%000511'
--or maopera.numcomp like 'A2066%000512'
--or maopera.numcomp like 'A2066%000513'
--or maopera.numcomp like 'A2066%000514'
--or maopera.numcomp like 'A2066%000515'
--or maopera.numcomp like 'A2066%000516'
--or maopera.numcomp like 'A2066%000517'
--or maopera.numcomp like 'A2066%000518'
--or maopera.numcomp like 'A2066%000519'
--or maopera.numcomp like 'A2066%000520'
--or maopera.numcomp like 'A2066%000521'
--or maopera.numcomp like 'A2066%000522'
--or maopera.numcomp like 'A2066%000523'
--or maopera.numcomp like 'A2066%000524'
--or maopera.numcomp like 'A2066%000525'
--or maopera.numcomp like 'A2066%000526'
--or maopera.numcomp like 'A2066%000527'
--or maopera.numcomp like 'A2066%000528'
--or maopera.numcomp like 'A2066%000529'
or maopera.numcomp like 'A2066%000572'
or maopera.numcomp like 'A2066%000597'
or maopera.numcomp like 'A2066%000598'
or maopera.numcomp like 'A2066%000602'
or maopera.numcomp like 'A2066%000603'
or maopera.numcomp like 'A2066%000604'
or maopera.numcomp like 'A2066%000605'
or maopera.numcomp like 'A2066%000606'
or maopera.numcomp like 'A2066%000607'
or maopera.numcomp like 'A2066%000608'
or maopera.numcomp like 'A2066%000609'
or maopera.numcomp like 'A2066%000610'
or maopera.numcomp like 'A2066%000611'
or maopera.numcomp like 'A2066%000612'
or maopera.numcomp like 'A2066%000613'
or maopera.numcomp like 'A2066%000614'
or maopera.numcomp like 'A2066%000615'
or maopera.numcomp like 'A2066%000616'
or maopera.numcomp like 'A2066%000617'
or maopera.numcomp like 'A2066%000618'
or maopera.numcomp like 'A2066%000619'
or maopera.numcomp like 'A2066%000620'
or maopera.numcomp like 'A2066%000621'

) )
and cabecpra.fecha > '20180101'
order by cabecpra.fecha

--SELECT * FROM MAOPERA WHERE NUMCOMP LIKE '_6162%'