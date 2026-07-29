
--comando para usar la base de datos específica
use db_jardineria;
go

--obtener todos los registros de clientes
select * from cliente;

--<> diferente
select * from cliente where nombre_contacto = 'Jose';
go
--mostrar listado de todos los clientes que no se llamen jose
select * from cliente where nombre_contacto <> 'Jose';
go

--comando para buscar un nombre = igual a ??
select nombre_contacto from cliente where nombre_cliente = 'Lasas S.A';


--- % parecido
select nombre_contacto
from cliente
where nombre_contacto
LIKE 'jos%'
go

--que enpiezen en an
select nombre_contacto
from cliente
where nombre_contacto
like 'an%'
--que empieze con ju
select nombre_contacto,apellido_contacto,telefono
from cliente
where nombre_contacto 
like 'ju%'

--que termine con ina
select nombre_contacto,apellido_contacto,telefono
from cliente
where nombre_contacto 
like '%a'


-- que empiecen con J
select nombre_contacto,apellido_contacto,telefono
from cliente
where nombre_contacto 
like 'J%'
--que en alguna parte tenga ui
select nombre_contacto,apellido_contacto,telefono
from cliente
where nombre_contacto 
like '%ui%'

---> limite meno o mayor
--nombre del contacto sea
select * from 
cliente
where limite_credito >= 30000

select * from cliente 
where nombre_contacto ='Anne'
and limite_credito > 18000

--operador logico
select * 
from cliente
where limite_credito > 3000
and ciudad = 'Miami'
--operador logico and (y)--
---en la ciudad que busca que tenga la letra lo
select * 
from cliente
where limite_credito > 3000
and ciudad like'%lo';

select * 
from cliente
where limite_credito > 3000
or ciudad = 'miami'

select * 
from cliente
where ciudad = 'cartago' or ciudad = 'Heredia'

select * from cliente

--algun espacio en null
select *
from cliente
where linea_direccion2 is null

select * from cliente where not ciudad = 'San Francisco'

select *
from cliente
where ciudad IN ('miami', 'madrid')
and codigo_empleado_rep_ventas between 5 and 8 and nombre_cliente like 'D%'