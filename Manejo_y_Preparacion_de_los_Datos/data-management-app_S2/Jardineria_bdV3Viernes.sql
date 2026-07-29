
use db_jardineria
--cuenta el total de clientes que hay 
Select Count (*)
AS total_clientes
From cliente

--cuenta los registros de limite credito
Select COUNT (limite_credito)
AS clientes_con_credito
FROM cliente

--calcula la suma de el limite credito
Select SUM(limite_credito)
AS total_credito
FROM cliente;

--calcula el promedio del credito
Select avg(limite_credito)
AS promedio_credito
from cliente;
go

--minimo de credito
select min(limite_credito)
as minimo_credito
from cliente
go

--cuente todos los clientes , suma todos los creditos , promedio de los creditos

select
count(*) as total_clientes,
max(limite_credito)as credito_maximo,
min(limite_credito)as credito_minimo,
avg(limite_credito) as promedio_credito,
sum(limite_credito) as total_credito
from cliente

-- min fecha_pedido
--max fecha_pedida
--selecciona el maximo y minimo de las fechas de pedido
select count(*) as total_pedido,
min(fecha_pedido) as minimo_fecha_pedido,
max(fecha_pedido) as maximo_fecha_pedido
from pedido

--Total de pedidos por clientes (solo los que tienen más de 5 pedidos)
select count(*) as total_pedido_cliente
from cliente
group by codigo_cliente
where total_pedido_cliente > 5
---------------------------------------------------------->

-- Total de pedidos por cliente (solo los que tienen más de 5 pedidos)
select codigo_cliente,
count(*) as total_pedido_cliente
from pedido
group by codigo_cliente
having count(*) > 5;

select * from producto
-- Promedio de precio de productos por gama (solo gamas caras)
select avg(precio_venta)
from producto
group by gama
having max(precio_venta)
--------------------------------------------------------------->


-- Promedio de precio de productos por gama (solo gamas caras)
select gama,
avg(precio_venta) AS promedio_precio
from producto
group by gama
having avg(precio_venta) > 10;



select * from cliente
select * from producto 
select * from pago
--Total pagado por cada cliente (solo los que han pagado mucho)--
select sum(total) as total_pagado
from pago
group by codigo_cliente
having total > 5000
-------------------------------------------------------->

-- Total pagado por cada cliente (solo los que han pagado mucho)
select codigo_cliente,
       sum(total) AS total_pagado
from pago
group by codigo_cliente
having sum(total) > 10000; --aqui uso un promedio 



--Cantidad de empleados por oficina (solo oficinas grandes)
select * from oficina

select codigo_oficina,
count(*) as cantidad_empleados
from empleado
------------------------------------------------------>
-- Cantidad de empleados por oficina (solo oficinas grandes)
select codigo_oficina,
count(*) as cantidad_empleados
from empleado
group by codigo_oficina
having count(*) > 5;
go

select * from producto
select * from pedido
select * from detalle_pedido

--Total de productos vendidos por pedido (solo pedidos grandes)
select codigo_pedido,
sum(cantidad) as total_producto
from detalle_pedido
group by codigo_pedido
having sum(cantidad) > 100;



--Clientes por país (solo países con mcuhos cliente)
Select pais,
COUNT(*)
AS total_clientes
From cliente
group by pais
having count(*) >3


use db_jardineria
----------------INNER JOIN-----
select
c.nombre_cliente,
p.codigo_pedido,
p.fecha_pedido
from cliente c
inner join pedido p
on c.codigo_cliente= p.codigo_cliente;

select * from pedido 
select * from cliente


--------------------
SELECT c.nombre_cliente
--img




select c.nombre_cliente,
p.codigo_pedido
from cliente c
left join pedido p
on c.codigo_cliente = p.codigo_cliente

select c.nombre_cliente,
p.codigo_pedido
from cliente c
right  join pedido p
on c.codigo_cliente = p.codigo_cliente




--codigo profesor---------------------------------------------------->
--------------------------------------------------------------------
use db_jardineria

SELECT 
    c.nombre_cliente,
    p.codigo_pedido,
    p.fecha_pedido
FROM cliente c
INNER JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente;


SELECT 
    c.nombre_cliente,
    p.codigo_pedido,
    pr.nombre AS producto,
    dp.cantidad
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto;

SELECT 
    c.nombre_cliente,
    p.codigo_pedido
FROM cliente c
LEFT JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente;

SELECT c.nombre_cliente
FROM cliente c
LEFT JOIN pedido p 
ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_pedido IS NULL;

SELECT 
    c.nombre_cliente,
    p.codigo_pedido
FROM cliente c
RIGHT JOIN pedido p
ON c.codigo_cliente = p.codigo_cliente;

SELECT 
    p.codigo_pedido,
    pr.nombre,
    dp.cantidad
FROM producto pr
RIGHT JOIN detalle_pedido dp 
ON pr.codigo_producto = dp.codigo_producto
RIGHT JOIN pedido p 
ON dp.codigo_pedido = p.codigo_pedido;










