--@utor:freddy sánchez zamora G-04

-----------------------------------------------------------------------------
--------------University Academic Management System ---------------
------------------------------------------------------------------------------

--delete the database if it already exists
--eliminar la base de datos si ya existe
Drop database if exists Matricula
go


-- create the database
-- crear la base de datos
create database Matricula
go

--utilizar base de datos matricula
--use the enrollment database
use Matricula



  --Table: career
--Description: Stores the professional careers offered by the university

--Tabla:carrera
--Descripcion: Almacena  las carreras profesionales ofrecinas por la universidad
-------------------------------------------------------------------------------------

create table carrera (
codigo_carrera int identity(1,1) not null primary key,
nombre varchar(80) not null,
grado_academico varchar(50),
total_creditos smallint not null
)
go


--Table: professor
--Description: Stores records of the university teaching staff
---------------------------------------------------------------------------------------
--Tabla:profesor
--Descripcion: Registro del cuerpo docente de la universidad
---------------------------------------------------------------------------------------

create table profesor (
codigo_profesor int not null identity(1,1) primary key,
nombre varchar(80) not null,
apellidos Nvarchar(100) not null,
especialidad varchar(100)not null,
telefono varchar(20) not null
)
go



--Table: course
--Description: Stores the courses offered by the university
----------------------------------------------------------------------------------------
--Tabla: curso
--Descripcion: Cursos o asignaturas que componen cada plan de estudios para una carrera específica
----------------------------------------------------------------------------------------

create table curso (
codigo_curso int not null identity (1,1) primary key,
nombre varchar (80) not null,
credito tinyint not null,
codigo_profesor int not null,
)
go


--Table: student
--Description: Stores the records of students enrolled at the university
------------------------------------------------------------------------------------------
--Tabla: estudiante
--Descripcion: informacion personal de los estudiantes 
------------------------------------------------------------------------------------------

create table estudiante (
codigo_estudiante int not null identity(1,1) primary key,
nombre varchar(80) not null,
apellidos varchar(100) not null,
fecha_nacimiento date not null,
edad tinyint not null,
correo varchar(100),
)
go



--Table: enrollment
--Description: Stores student enrollment records, including the enrollment date, student, and career
------------------------------------------------------------------------------------------
--Tabla: matricula
--Descripcion: Registro principal de la matricula de un estudiante para una carrera específica
------------------------------------------------------------------------------------------

create table matricula (
codigo_matricula int not null identity(1,1) primary key,
fecha_matricula date not null,
codigo_estudiante int not null,
codigo_carrera int not null
)
go



--Table: enrollment_detail
--Description: Stores the specific courses enrolled in an enrollment, including the group and status
--Relationship fields: enrollment_code, course_code, professor_code
------------------------------------------------------------------------------------------
--Tabla: detalle_matricula
--Descripcion: Cursos específicos inscritos dentro de una matricula, con grupo y estado
--Campos de relacion: codigo_matricula, codigo_curso, codigo_profesor
create table detalle_matricula(
codigo_detalle_matricula int not null identity(1,1) primary key,
codigo_matricula int not null,
codigo_curso int not null,
grupo varchar(10) not null,
estado varchar(20) not null
)
go


--Insert data into the tables
-----------------------------------------------------------------------------------------------------------------------------------------
--Operacion: Insertar datos en la tablas 
--Descripcion: Insertar datos en tablas de la base de datos para la gestion de matricula
--
-----------------------------------------------------------------------------------------------------------------------------------------






--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Insert data into CAREER table    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

INSERT INTO carrera (nombre, grado_academico, total_creditos)
VALUES 
('Ingeniería de Software', 'Bachillerato', 144), ('Ingeniería Informática', 'Bachillerato', 136),
('Administración de Empresas', 'Licenciatura', 150), ('Contaduría Pública', 'Bachillerato', 140),
('Administración de Negocios', 'Bachillerato', 132), ('Mercadeo', 'Bachillerato', 128), ('Recursos Humanos',
'Bachillerato', 130), ('Economía', 'Licenciatura', 150), ('Finanzas', 'Bachillerato', 136), ('Ingeniería Industrial',
'Licenciatura', 160), ('Ingeniería Civil', 'Licenciatura', 165), ('Ingeniería Eléctrica', 'Licenciatura', 160),
('Ingeniería Mecánica', 'Licenciatura', 162), ('Ingeniería Electrónica', 'Bachillerato', 145), ('Arquitectura',
'Licenciatura', 180), ('Diseño Gráfico', 'Bachillerato', 128), ('Comunicación', 'Bachillerato', 130), ('Periodismo',
'Licenciatura', 145), ('Derecho', 'Licenciatura', 160), ('Psicología', 'Licenciatura', 150), ('Educación Primaria',
'Bachillerato', 128), ('Educación Preescolar', 'Bachillerato', 125), ('Enseñanza del Inglés', 'Bachillerato', 132),
('Matemática', 'Bachillerato', 135), ('Física', 'Bachillerato', 136), ('Química', 'Bachillerato', 138), ('Biología', 
'Bachillerato', 140), ('Ciencias Ambientales', 'Licenciatura', 150), ('Turismo', 'Bachillerato', 128), ('Hotelería',
'Bachillerato', 130), ('Gastronomía', 'Técnico', 96), ('Administración Aduanera', 'Bachillerato', 132),
('Comercio Internacional', 'Licenciatura', 145), ('Logística y Distribución', 'Bachillerato', 130),
('Informática Empresarial', 'Bachillerato', 136), ('Análisis de Datos', 'Bachillerato', 128),
('Inteligencia Artificial', 'Licenciatura', 150), ('Ciberseguridad', 'Bachillerato', 140),
('Redes y Telecomunicaciones', 'Bachillerato', 138), ('Desarrollo Web', 'Bachillerato', 125); 

GO

--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   Insert data into PROFESSOR table >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

INSERT INTO profesor (nombre, apellidos, especialidad, telefono) 
VALUES 
('Carlos', 'Rodríguez Méndez', 'Programación', '8888-1001'), ('María', 'González Vargas', 'Bases de Datos', 
'8888-1002'), ('José', 'Hernández Castro', 'Redes y Telecomunicaciones', '8888-1003'), ('Ana', 'Martínez Solano',
'Matemática', '8888-1004'), ('Luis', 'Ramírez Soto', 'Ingeniería de Software', '8888-1005'), ('Laura', 'Fernández Mora',
'Administración', '8888-1006'), ('Andrés', 'Vargas Jiménez', 'Contaduría', '8888-1007'), ('Patricia', 'Rojas Herrera',
'Mercadeo', '8888-1008'), ('Daniel', 'Chaves Navarro', 'Economía', '8888-1009'), ('Sofía', 'Méndez Quesada', 'Finanzas', 
'8888-1010'), ('Fernando', 'Solís Araya', 'Ingeniería Industrial', '8888-1011'), ('Gabriela', 'Castro León', 'Ingeniería Civil',
'8888-1012'), ('Diego', 'Vega Ramírez', 'Ingeniería Eléctrica', '8888-1013'), ('Valeria', 'Jiménez Pérez', 'Electrónica', 
'8888-1014'), ('Roberto', 'Mora Salazar', 'Arquitectura', '8888-1015'), ('Natalia', 'Herrera Campos', 'Diseño Gráfico',
'8888-1016'), ('Alejandro', 'Sánchez Ruiz', 'Comunicación', '8888-1017'), ('Carolina', 'Pérez Alfaro', 'Periodismo',
'8888-1018'), ('Miguel', 'Alvarado Brenes', 'Derecho', '8888-1019'), ('Daniela', 'Cordero Vargas', 'Psicología', '8888-1020'),
('Jorge', 'Navarro Solís', 'Educación', '8888-1021'), ('Melissa', 'Quesada Rojas', 'Educación Preescolar', '8888-1022'),
('Esteban', 'Araya Jiménez', 'Inglés', '8888-1023'), ('Andrea', 'León Castro', 'Matemática', '8888-1024'),
('Mauricio', 'Soto Vargas', 'Física', '8888-1025'), ('Paola', 'Salas Méndez', 'Química', '8888-1026'), ('Ricardo', 
'Campos Rojas', 'Biología', '8888-1027'), ('Karla', 'Brenes Chacón', 'Ciencias Ambientales', '8888-1028'), ('Óscar', 
'Chacón Herrera', 'Turismo', '8888-1029'), ('Silvia', 'Alfaro Vargas', 'Hotelería', '8888-1030'), ('Marco', 
'Vargas Solano', 'Gastronomía', '8888-1031'), ('Adriana', 'Solano Rojas', 'Aduanas', '8888-1032'), ('Pablo', 
'Jiménez Mora', 'Comercio Internacional', '8888-1033'), ('Fernanda', 'Mora Castro', 'Logística', '8888-1034'),
('Cristian', 'Vargas Pérez', 'Informática Empresarial', '8888-1035'), ('Rebeca', 'Rojas Méndez', 'Análisis de Datos',
'8888-1036'), ('Kevin', 'Herrera Solís', 'Inteligencia Artificial', '8888-1037'), ('Monserrat', 'Castro Chaves', 
'Ciberseguridad', '8888-1038'), ('Sergio', 'León Quesada', 'Telecomunicaciones', '8888-1039'), ('Verónica', 
'Salazar Campos', 'Desarrollo Web', '8888-1040'); 
GO


--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   Insert data into COURSE table >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


INSERT INTO curso (nombre, credito, codigo_profesor)
VALUES
('Programación I', 4, 1), ('Bases de Datos I', 4, 2),
('Redes de Computadoras', 3, 3), ('Matemática Discreta', 3, 4), ('Ingeniería de Software I', 4, 5), 
('Administración General', 3, 6), ('Contabilidad I', 4, 7), ('Mercadeo I', 3, 8), ('Economía General', 3, 9),
('Finanzas Empresariales', 4, 10), ('Procesos Industriales', 4, 11), ('Mecánica Aplicada', 4, 12),
('Circuitos Eléctricos', 4, 13), ('Sistemas Electrónicos', 4, 14), ('Diseño Arquitectónico I', 5, 15),
('Diseño Digital', 3, 16), ('Comunicación Organizacional', 3, 17), ('Redacción Periodística', 3, 18),
('Derecho Constitucional', 4, 19), ('Psicología General', 3, 20), ('Didáctica General', 3, 21),
('Educación Infantil', 3, 22), ('Inglés I', 3, 23), ('Cálculo I', 4, 24), ('Física I', 4, 25), 
('Química General', 4, 26), ('Biología General', 4, 27), ('Gestión Ambiental', 3, 28),
('Administración Turística', 3, 29), ('Gestión Hotelera', 3, 30), ('Cocina Internacional', 4, 31), 
('Legislación Aduanera', 3, 32), ('Comercio Internacional', 3, 33), ('Logística y Distribución', 4, 34),
('Sistemas de Información', 4, 35), ('Análisis de Datos I', 4, 36), ('Inteligencia Artificial I', 4, 37),
('Seguridad Informática', 4, 38), ('Telecomunicaciones I', 4, 39), ('Desarrollo Web I', 4, 40); 

GO


--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   Insert data into STUDENT table >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

INSERT INTO estudiante (nombre, apellidos, fecha_nacimiento, edad, correo)
VALUES
('Juan', 'Pérez Rodríguez', '2002-01-15', 24, 'juan.perez@universidad.edu'), ('María', 'Gómez Vargas', '2001-03-22', 25, 
'maria.gomez@universidad.edu'), ('Carlos', 'Sánchez Mora', '2003-05-10', 23, 'carlos.sanchez@universidad.edu'), ('Ana', 
'Rodríguez Castro', '2000-07-18', 26, 'ana.rodriguez@universidad.edu'), ('Luis', 'Hernández Solano', '2002-09-05', 23,
'luis.hernandez@universidad.edu'), ('Laura', 'Martínez Rojas', '2001-11-30', 24, 'laura.martinez@universidad.edu'), 
('José', 'Vargas Jiménez', '2003-02-14', 23, 'jose.vargas@universidad.edu'), ('Sofía', 'Ramírez Campos', '2002-04-25',
24, 'sofia.ramirez@universidad.edu'), ('Daniel', 'Fernández Mora', '2000-06-12', 26, 'daniel.fernandez@universidad.edu'),
('Gabriela', 'Chaves Solís', '2001-08-20', 24, 'gabriela.chaves@universidad.edu'), ('Andrés', 'Méndez Vargas', '2003-10-03',
22, 'andres.mendez@universidad.edu'), ('Valeria', 'Castro Rojas', '2002-12-17', 23, 'valeria.castro@universidad.edu'),
('Fernando', 'Solís Herrera', '2000-01-28', 26, 'fernando.solis@universidad.edu'), ('Natalia', 'Vega Quesada', '2001-03-09',
25, 'natalia.vega@universidad.edu'), ('Diego', 'Jiménez Pérez', '2003-05-21', 23, 'diego.jimenez@universidad.edu'), 
('Carolina', 'Mora Salazar', '2002-07-07', 24, 'carolina.mora@universidad.edu'), ('Roberto', 'Herrera Campos', '2000-09-16',
25, 'roberto.herrera@universidad.edu'), ('Daniela', 'Alvarado Ruiz', '2001-11-11', 24, 'daniela.alvarado@universidad.edu'),
('Miguel', 'Cordero Vargas', '2003-01-19', 23, 'miguel.cordero@universidad.edu'), ('Paola', 'Navarro León', '2002-03-27', 24,
'paola.navarro@universidad.edu'), ('Jorge', 'Quesada Rojas', '2000-05-06', 26, 'jorge.quesada@universidad.edu'), ('Melissa', 
'Araya Jiménez', '2001-07-23', 25, 'melissa.araya@universidad.edu'), ('Esteban', 'León Castro', '2003-09-14', 22,
'esteban.leon@universidad.edu'), ('Andrea', 'Soto Vargas', '2002-11-02', 23, 'andrea.soto@universidad.edu'), 
('Mauricio', 'Salas Méndez', '2000-12-29', 25, 'mauricio.salas@universidad.edu'), ('Karla', 'Campos Rojas', 
'2001-02-08', 25, 'karla.campos@universidad.edu'), ('Ricardo', 'Brenes Chacón', '2003-04-19', 23, 'ricardo.brenes@universidad.edu'),
('Silvia', 'Chacón Herrera', '2002-06-30', 24, 'silvia.chacon@universidad.edu'), ('Óscar', 'Alfaro Vargas', '2000-08-15', 25,
'oscar.alfaro@universidad.edu'), ('Adriana', 'Solano Rojas', '2001-10-27', 24, 'adriana.solano@universidad.edu'), 
('Pablo', 'Jiménez Mora', '2003-12-04', 22, 'pablo.jimenez@universidad.edu'), ('Fernanda', 'Mora Castro', '2002-01-31', 
24, 'fernanda.mora@universidad.edu'), ('Cristian', 'Vargas Pérez', '2000-04-11', 26, 'cristian.vargas@universidad.edu'), 
('Rebeca', 'Rojas Méndez', '2001-06-24', 25, 'rebeca.rojas@universidad.edu'), ('Kevin', 'Herrera Solís', '2003-08-09', 22, 
'kevin.herrera@universidad.edu'), ('Monserrat', 'Castro Chaves', '2002-10-18', 23, 'monserrat.castro@universidad.edu'), 
('Sergio', 'León Quesada', '2000-12-12', 25, 'sergio.leon@universidad.edu'), ('Verónica', 'Salazar Campos', '2001-02-26', 
25, 'veronica.salazar@universidad.edu'), ('Alejandro', 'Pérez Solano', '2003-04-07', 23, 'alejandro.perez@universidad.edu'), 
('Camila', 'González Rojas', '2002-09-22', 23, 'camila.gonzalez@universidad.edu'); 
GO


--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   Insert data into ENROLLMENT table  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


INSERT INTO matricula (fecha_matricula, codigo_estudiante, codigo_carrera) 
VALUES ('2026-01-10', 1, 1), ('2026-01-10', 2, 2), ('2026-01-11', 3, 3), ('2026-01-11', 4, 4), ('2026-01-12', 5, 5), 
('2026-01-12', 6, 6), ('2026-01-13', 7, 7), ('2026-01-13', 8, 8), ('2026-01-14', 9, 9), ('2026-01-14', 10, 10), 
('2026-01-15', 11, 11), ('2026-01-15', 12, 12), ('2026-01-16', 13, 13), ('2026-01-16', 14, 14), ('2026-01-17', 15, 15),
('2026-01-17', 16, 16), ('2026-01-18', 17, 17), ('2026-01-18', 18, 18), ('2026-01-19', 19, 19), ('2026-01-19', 20, 20), 
('2026-01-20', 21, 21), ('2026-01-20', 22, 22), ('2026-01-21', 23, 23), ('2026-01-21', 24, 24), ('2026-01-22', 25, 25), 
('2026-01-22', 26, 26), ('2026-01-23', 27, 27), ('2026-01-23', 28, 28), ('2026-01-24', 29, 29), ('2026-01-24', 30, 30),
('2026-01-25', 31, 31), ('2026-01-25', 32, 32), ('2026-01-26', 33, 33), ('2026-01-26', 34, 34), ('2026-01-27', 35, 35), 
('2026-01-27', 36, 36), ('2026-01-28', 37, 37), ('2026-01-28', 38, 38), ('2026-01-29', 39, 39), ('2026-01-29', 40, 40); 
GO 



--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<   Insert data into ENROLLMENT_DETAIL table  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

INSERT INTO detalle_matricula (codigo_matricula, codigo_curso, grupo, estado)
VALUES (1, 1, 'A', 'Matriculado'), (2, 2, 'A', 'Matriculado'), (3, 3, 'B', 'Matriculado'),
(4, 4, 'A', 'Aprobado'), (5, 5, 'B', 'Matriculado'), (6, 6, 'A', 'Aprobado'), 
(7, 7, 'C', 'Matriculado'), (8, 8, 'A', 'Retirado'), (9, 9, 'B', 'Matriculado'), (10, 10, 'A', 'Aprobado'),
(11, 11, 'C', 'Matriculado'), (12, 12, 'B', 'Matriculado'), (13, 13, 'A', 'Aprobado'), (14, 14, 'B', 'Matriculado'),
(15, 15, 'A', 'Matriculado'), (16, 16, 'C', 'Aprobado'), (17, 17, 'A', 'Matriculado'), (18, 18, 'B', 'Retirado'),
(19, 19, 'A', 'Matriculado'), (20, 20, 'C', 'Aprobado'), (21, 21, 'A', 'Matriculado'), (22, 22, 'B', 'Matriculado'),
(23, 23, 'A', 'Aprobado'), (24, 24, 'C', 'Matriculado'), (25, 25, 'B', 'Matriculado'), (26, 26, 'A', 'Aprobado'),
(27, 27, 'C', 'Matriculado'), (28, 28, 'A', 'Retirado'), (29, 29, 'B', 'Matriculado'), (30, 30, 'A', 'Aprobado'),
(31, 31, 'C', 'Matriculado'), (32, 32, 'B', 'Matriculado'), (33, 33, 'A', 'Aprobado'), (34, 34, 'C', 'Matriculado'),
(35, 35, 'B', 'Matriculado'), (36, 36, 'A', 'Aprobado'), (37, 37, 'C', 'Matriculado'), (38, 38, 'A', 'Retirado'),
(39, 39, 'B', 'Matriculado'), (40, 40, 'A', 'Aprobado'); 

GO
--=====================================================================================================
----------------------------------------DISPLAY DATA FROM EACH TABLE --------------------------------
--====================================================================================================
select * from estudiante
select * from profesor
select * from curso
select * from matricula
select * from detalle_matricula
select * from carrera


--====================================================================================================
--=======================================  SQL QUERIES ==============================================
--====================================================================================================


--#1 SELECT: Display all the information from the student table
--#1 SELECT: Visualizar toda la informacion de la tabla estudiante
select * from estudiante
go


--#2 WHERE: Display the first name, last name, and age of all students whose age is greater than or equal to 18 years.
--#2 WHERE : Visualizar el nombre, apellido y edad de todos los estudiantes donde la edad sea mayor o igual a 18 años.
select nombre,apellidos,edad
from estudiante
where edad >=18;
go



--#3 ORDER BY: Display the first and last names of the students in descending order Z -> A
--#3 ORDER BY: Visualizar el nombre y apellidos de los estudiantes en orden descendente Z-> A 
select nombre, apellidos
from estudiante
order by nombre desc
go



--#4 DISTINCT: Display the first name, last name, and specialty of professors whose specialty is different from administration
--#4 DISTINCT : visualizar el nombre, apellido y especialidad del profesor donde su especialidad sea distinta a administracion
select distinct nombre, apellidos,especialidad
from profesor 
where especialidad <> 'administracion'
go



--#5 TOP: Display the 5 courses with the most credits
--#5 TOP: mostrar los 5 cursos con más créditos
select top 5 nombre, credito
from curso 
order by credito Desc
go



--#6 LIKE: Display courses whose name ends in 'al'
--#6 LIKE: mostrar cursos cuyo nombre  termine en 'al'
select nombre,credito
from curso 
where nombre like '%al'
go


--#7 BETWEEN: Display the name and age of students between 23 and 25 years old
--#7 BETWEEN: mostrar el nombre y edad de estudiantes con edad entre 23 y 25 años
select nombre, edad
from estudiante
where edad between 23 and 25
go



--#8 IN: Display careers with an academic degree from the list containing Bachelor's and Licentiate degrees
--#8 IN: mostrar carreras con grado academico de la lista que contenga Licenciatura y bachillerato
select nombre, grado_academico
from carrera
where grado_academico IN ('Licenciatura', 'Bachillerato')
go



--#9. NOT: Courses that do not have 3 credits
--#9. NOT: cursos que no tengan 3 creditos
select nombre, credito
from curso
where not credito = 3
go


--#10 IS NULL: Enrollments without an enrollment date
--Explanation: Since the data in the table is mandatory, the query will not return any results
--#10 IS NULL: matrículas sin fecha de matrícula
--Explicación: como los datos de la tabla son obligatorios entonces la consulta no mostrara resultados
select codigo_matricula fecha_matricula
from matricula
where fecha_matricula is null
go


--#11 IS NOT NULL: Display the first and last names of professors who have a registered specialty
--#11 IS NOT NULL: mostrar nombre y apellidos de profesores que si tienen una especialidad registrada
select nombre, apellidos
from profesor
where especialidad is not null
go


--#12 AND: Display the first name, last name, and age of students whose age is greater than or equal to 23 and less than or equal to 25
--#12 AND : mostrar nombre, apellidos y la edad de los estudiantes con edad mayor o igual a 23  y menor o igual a 25
select nombre, apellidos, edad
from estudiante
where edad >=23 and edad <= 25
go


--#13 OR: Display the first name, last name, and specialty of professors whose specialty is Cybersecurity or Administration
--#13 OR: mostrar nombre , apellidos y especialidad de los profesores cuya especialidad sea Ciberseguridad o Administración
select nombre , apellidos, especialidad
from profesor
where especialidad = 'Ciberseguridad' or especialidad = 'Física'
go


--#14 GROUP BY: Display the number of courses by number of credits
--#14 GROUP BY : mostrar cantidad de cursos por cantiadad de creditos
select credito, count(*) as cantidad_cursos
from curso
group by credito;
go



--#15 HAVING: Display professor specialties that are repeated more than once
--#15 HAVING: mostarar especialidades de profesores que se repitan más de una vez
select especialidad, count(*) as cantidad_profesores
from profesor
group by especialidad
having count(*) > 1
go


--#16 COUNT: Display the total number of registered courses
--#16 COUNT: Mostrar total de cursos registrados
select count(*) as total_cursos
from curso
go


--#17 SUM: Display the total sum of credits for all courses
--#17 SUM: mostrar suma total de créditos de todos los cursos
select sum(credito) as total_creditos
from curso
go


--#18 AVG: Display the average age of the students
--#18 AVG: mostrar promedio de edad de los estudiantes
select avg(edad) as promedio_edad
from estudiante
go


--#19 MIN: Display the minimum, the lowest number of credits of a course
--#19 MIN: mostrar el mínimo ,la menor cantidad de creditos de un curso
select min(credito) as credito_minimo
from curso
go


--#20 MAX: Display the maximum number of credits
--#20 MAX: mostrar el valor maximo de creditos
select max(credito) as maximo_credito
from curso
go


--#21 INNER JOIN: Display each course with the professor's name
--#21 INNER JOIN: mostrar cada curso con el nombre del profesor
select c.nombre as nombre_curso, p.nombre as nombre_profesor , p.apellidos
from curso c INNER JOIN profesor p ON c.codigo_profesor = p.codigo_profesor
go


--#22 LEFT JOIN: Display all careers together with the names of the students enrolled in them
--#22 LEFT JOIN:mostrar todas las carreras junto con el nombre de los estudiantes matriculados en ellas
select
 c.nombre as carrera,
 e.nombre as nombre_estudiante,
 e.apellidos as apellidos_estudiante
 from carrera c
 left join matricula m ON c.codigo_carrera = m.codigo_carrera
 left join estudiante e ON m.codigo_estudiante  = e.codigo_estudiante
 order by  c.nombre
 go


 --#22 RIGHT JOIN: List all courses together with their enrollment group and status
 --#23 RIGHT JOIN: listar todos los cursos junto con su grupo y estado de matricula
 select 
 c.nombre as curso,
 dm.grupo,
 dm.estado
 from detalle_matricula dm
 RIGHT JOIN curso c ON dm.codigo_curso = c.codigo_curso
 go



 --===================================================================================================
 --============================== SQL SUBQUERIES ===================================================
 --===================================================================================================


 --#23 SUBQUERIES: Students enrolled in careers with more than 80 total credits
 --#23 SUBCONSULTAS: estudiantes matriculados  en carreras con más de 80 creditos totales
 select nombre, apellidos
 from estudiante
 where codigo_estudiante IN (select m.codigo_estudiante
 from matricula m INNER JOIN carrera c ON m.codigo_carrera = c.codigo_carrera
 where c.total_creditos > 80 )
 go



 --#24 SUBQUERY: Professors who teach courses with more credits than the overall average number of credits
 --#24 SUBCONSULTA : profesores que imparten cursos con más créditos que el promedio general de créditos
 select nombre, apellidos, especialidad
 from profesor
 where codigo_profesor IN (
 select codigo_profesor
 from curso
 where credito > (select avg(credito) from curso)
 )
 go



 --#25 SUBQUERY: Careers that do not have any enrolled students
 --#25 SUBCONSULTA: carreras que no tienen ningún estudiante matriculado
 select nombre, grado_academico
 from carrera
 where codigo_carrera NOT IN (
 select codigo_carrera
 from matricula)
 go


 --===================================================================================================
 --================================ SQL VIEWS =======================================================
 --===================================================================================================



 --#26.CREATE VIEW: View with the details of each course and professor
 --#26.CREATE VIEW: vista con el detalle de cada una curso y profesor
 create view vista_cursos_profesores as
 select
 cu.nombre as curso,
 cu.credito,p.nombre as profesor,
 p.apellidos,p.especialidad
 from curso cu
 INNER JOIN profesor p ON cu.codigo_profesor = p.codigo_profesor
 go


 --display the view data
 --visualizar los datos de la vista
 select * from vista_cursos_profesores
 go


--#27 CREATE VIEW: View with the students and the career in which they are enrolled
--#27 CREATE VIEW : vista con los estudiantes y carrera en la que están matriculados 
create view vista_estudiantes_carreras AS 
select 
e.nombre as estudiante, 
e.apellidos, c.nombre as carrera,
m.fecha_matricula
from estudiante e
INNER JOIN matricula m ON e.codigo_estudiante = m.codigo_estudiante
INNER JOIN carrera c ON m.codigo_carrera = c.codigo_carrera

--display the data from the student_careers view
--visualizar los datos de la vista  estudiante_carreras
select * from vista_estudiantes_carreras
go


--#28 CREATE VIEW: View with the basic data of a student
--#28 CREATE VIEW : vista con los datos basicos de un estudiante
create view vista_estudiante as
select
nombre,apellidos,edad,correo
from estudiante
go


--display the data from the student view
--visualizar datos de la vista estudiante
select * from vista_estudiante
go


--#29 CREATE VIEW: View with the course name and number of credits
--#29 CREATE VIEW: vista con los datos de nombre del curso y cantidad de creditos
create view vista_curso as 
select 
nombre,credito
from curso
go


--view the data from the course_view
--ver los datos de la vista_curso
select * from vista_curso
go

