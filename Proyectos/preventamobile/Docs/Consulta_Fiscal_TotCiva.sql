use gestion
go
select * from maopera order by id desc
select * from dcuerfac where idmaopera = 110000000056
select * from cuerfac  order by id desc

--update cuerfac set 
--totalciva = (select dcuerfac.uniciva from afedmaope 
--	left join dcuerfac on afedmaope.iddmaopera = dcuerfac.idmaopera 
--	where afedmaope.idmaopera = cuerfac.idmaopera and cuerfac.idarticulo = dcuerfac.idarticulo and cuerfac.cantidad = dcuerfac.cantidad and cuerfac.despor = dcuerfac.despor)
--,totalsiva = (select dcuerfac.unisiva from afedmaope 
--	left join dcuerfac on afedmaope.iddmaopera = dcuerfac.idmaopera 
--	where afedmaope.idmaopera = cuerfac.idmaopera and cuerfac.idarticulo = dcuerfac.idarticulo and cuerfac.cantidad = dcuerfac.cantidad and cuerfac.despor = dcuerfac.despor)
--where idmaopera in (select id from maopera where programa = 'IMPDIFERIDA')


--select dcuerfac.uniciva from afedmaope 
--	left join dcuerfac on afedmaope.iddmaopera = dcuerfac.idmaopera 
--	where afedmaope.idmaopera = 110000000056 and cuerfac.idarticulo = dcuerfac.idarticulo and cuerfac.cantidad = dcuerfac.cantidad
