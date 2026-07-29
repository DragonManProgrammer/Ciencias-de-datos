
use db_jardineria
go


--Buscar registros con valores null
select nombre_cliente, ciudad, region
from cliente
where region is null;




-- empleados que no tienen jefe asignado
select nombre, apellido1,codigo_jefe
from empleado 
where codigo_jefe is null

--Pedidos que aun no han sido entregados 

select codigo_pedido, fecha_pedido, fecha_entrega
from pedido
where fecha_entrega is null
go

--Clientes que sí tienen limite de credito is not null
select * from cliente

select nombre_cliente, limite_credito
from cliente
where limite_credito is not null

--oficinas que tienen segunda direccion
select ciudad,linea_direccion2
from oficina 
where linea_direccion2 is not null;

--Reemplazar valores null coalesce
--coalesce sirve para mostrar otros valor cuando aparece null.--
select nombre_cliente,
COALESCE(region, 'sin region')
as region 
from cliente;
--"No tiene jefe" cuando el empleado no tenga jefe---

select 
nombre,apellido1,
COALESCE(CAST(codigo_jefe AS Varchar), 'No tiene jefe')
as jefe
from empleado;

--Mostrar comentarios de pedidos
--si el pedido no tiene comentarios, aparece ""sin comentario
select codigo_pedido,fecha_pedido,
COALESCE(comentarios, 'sin comentario')
as comentarios 
from pedido;

select * from pedido


--Clientes que tienen región y límite de crédito--
-- limite credito is not null

select * from cliente


select codigo_cliente, nombre_cliente,region
from cliente
where region is not null and limite_credito is not null;


--Crear vistas-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<>>>>>>>>>>>>>>>>>>>>
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><>


CREATE VIEW vista_cliente AS
select nombre_cliente,ciudad,pais
from cliente;
go

select * from vista_cliente

--Ejemplo 2: Vista de productos caros
select * from producto 


create view vista_producto as
select codigo_producto,nombre
from producto 
where precio_venta >100
go

select * from vista_producto 
go

select * from pedido 
select * from cliente
--codpedido, nombre cliente, fechaped
--Ejemplo 3 vista con inner JOIN
create view vista_pedido_cliente as
select 
p.codigo_pedido,
c.nombre_cliente,
p.fecha_pedido
from pedido p
INNER JOIN cliente c on c.codigo_cliente = p.codigo_cliente;
go

select * from vista_pedido_cliente


--ejemplo 4 Vista con funciones de agreación group by
--cantidad de pedidos por cliente 


create view total_pagos_cliente
as 
select codigo_cliente,
SUM(total)
as total_pagado
from pago
group by  codigo_cliente;

select * from total_pagos_cliente;



create view total_pagos_cliente_max
as 
select codigo_cliente,
MAX(total)
as total_pagado
from pago
group by  codigo_cliente;

select * from total_pagos_cliente_max;



--¿ejemplo adicional-?
select * from pedido 
select * from cliente

create view vista_pedidos_cliente
as
select count(*) as 'cant.pedidos'
from pedido
group by codigo_cliente;

select * from vista_pedidos_cliente



--Con CTE

WITH promedio AS (
    SELECT AVG(precio_venta) AS precio_promedio
    FROM producto
)
SELECT nombre, precio_venta
FROM producto, promedio
WHERE precio_venta > promedio.precio_promedio;