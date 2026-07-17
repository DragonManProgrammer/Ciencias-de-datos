


--Tabla= entidad--

--Empleado, Persona, producto , cliente, categoria,

--CREAR LA BASE DE DATOS
create database clase2
go

use clase2
go


--TRABAJAR CON TABLAS
--cliente va a tener , id,nombre,apellido,telefono,direccion,correo
--atributo + tipo de dato
--ej id    + int
create table cliente (
id int not null,
nombre varchar(30) not null,
telefono int,
edad int,
correo varchar(50))
go

--crear tabla de productos
create table producto(
id int not null,
nombre varchar(30),
precio int
)