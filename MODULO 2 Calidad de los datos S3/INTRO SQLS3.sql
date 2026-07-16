
/*AUTOR:@Freddy Sánchez Zamora*/

create database clase1
go

use clase1
go
--TABLA USUARIO--
create table usuario(
id int not null,
nombre varchar (30) not null,
correo varchar (50) not null
)
go
--TABLA PRODUCTOS--
Create table Producto(
id int not null,
idcategoria int not null,
nombre varchar(30) not null,
descripcion varchar(50) not null,
precio decimal(10,2) not null
)
go
--TABLA CATEGORIA
Create table categoria(
id int not null,
nombre varchar(30) not null,
descripcion varchar(50) not null
)
go

--Insertar datos USUARIO--
INSERT INTO Usuario (id, nombre, correo) VALUES
(1, 'Freddy Sanchez', 'freddy@gmail.com'),
(2, 'Maria Rodriguez', 'maria@gmail.com'),
(3, 'Carlos Mora', 'carlos@gmail.com'),
(4, 'Ana Lopez', 'ana@gmail.com'),
(5, 'Jorge Castillo', 'jorge@gmail.com'),
(6, 'Sofia Jimenez', 'sofia@gmail.com'),
(7, 'Luis Vargas', 'luis@gmail.com');
GO




--Insertar datos tabla Categoria
INSERT INTO Categoria (id, nombre, descripcion) VALUES
(1, 'Lacteos', 'Productos derivados de la leche'),
(2, 'Bebidas', 'Refrescos y bebidas naturales'),
(3, 'Abarrotes', 'Productos de consumo diario'),
(4, 'Carnes', 'Carnes de res, pollo y cerdo'),
(5, 'Panaderia', 'Pan y productos horneados'),
(6, 'Frutas', 'Frutas frescas'),
(7, 'Verduras', 'Vegetales frescos');
GO

--Insertar datos tabla Producto

INSERT INTO Producto (id, idcategoria, nombre, descripcion, precio) VALUES
(1, 1, 'Leche Entera', 'Leche de 1 litro', 950.00),
(2, 2, 'Coca Cola', 'Botella de 2.5 litros', 1800.00),
(3, 3, 'Arroz', 'Bolsa de 2 kg', 2300.00),
(4, 4, 'Pechuga de Pollo', '1 kilogramo', 4200.00),
(5, 5, 'Pan Integral', 'Paquete de 500 gramos', 1500.00),
(6, 6, 'Manzana', '1 kilogramo', 1700.00),
(7, 7, 'Tomate', '1 kilogramo', 1200.00);
GO



--RECUPERAR INFORMACION--
select * from usuario
select * from Producto
select* from categoria

