


--CREAR BASE DE DATOS
create database estudiante
go
--ESPECIFICAR EL USO DE LA BD
use estudiante
go
--INSTRUCCION CREAR TABLA ALUMNOA
create table Alumno(
id int primary key identity (1,1),
nombre varchar (30) not null,
apellido varchar (50) not null,
domicilio varchar (50) not null
)
go
--INSTRUCCION CREAR TABLA ASIGNATURA,
create table Asignatura(
id int primary key identity(1,1),
nombre varchar(30) not null
)
go

create table Calificacion(
id_Alumno int not null,
id_Asignatura  int not null,
nota decimal(4,2) not null
--Integridad Referencial pendiente(Claves foraneas)
)
go
--INSERTAR DATOS

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Freddy', 'Sánchez', 'San Ramón, Alajuela');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('María', 'Rodríguez', 'Palmares, Alajuela');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Carlos', 'Jiménez', 'Naranjo, Alajuela');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Ana', 'Mora', 'Grecia, Alajuela');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('José', 'Solano', 'San José, Costa Rica');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Laura', 'Vargas', 'Heredia, Costa Rica');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('David', 'Castro', 'Cartago, Costa Rica');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Sofía', 'Ramírez', 'Alajuela Centro');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Andrés', 'Rojas', 'Atenas, Alajuela');

INSERT INTO Alumno (nombre, apellido, domicilio)
VALUES ('Valeria', 'Araya', 'San Carlos, Alajuela');

GO




--INSERCION DE DATOS

INSERT INTO Asignatura (nombre)
VALUES ('Matemáticas');

INSERT INTO Asignatura (nombre)
VALUES ('Español');

INSERT INTO Asignatura (nombre)
VALUES ('Ciencias');

INSERT INTO Asignatura (nombre)
VALUES ('Estudios Sociales');

INSERT INTO Asignatura (nombre)
VALUES ('Inglés');

INSERT INTO Asignatura (nombre)
VALUES ('Informática');

INSERT INTO Asignatura (nombre)
VALUES ('Bases de Datos');

INSERT INTO Asignatura (nombre)
VALUES ('Programación');

INSERT INTO Asignatura (nombre)
VALUES ('Redes');

INSERT INTO Asignatura (nombre)
VALUES ('Análisis de Datos');


GO

--CONSULTAR INFORMACION DE LAS TABLAS

SELECT * FROM Alumno
SELECT * From Asignatura

