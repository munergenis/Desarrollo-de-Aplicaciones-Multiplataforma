/****************************************************
Este Script contiene la definición de una tablas sencillas
pertenecientes a una base de datos MySQL. Importante e imprescindible 
ejecutar el Script en el orden en que están las sentencias. Para crear correctamente
la base de dadtos junto con todas las tablas, seleccionar contenido de este fichero 
de línea 1 a línea 87 y ejecutar.

A continuación se muestran ejemplos de usos básicos con índices

Autor: Hugo Pelayo
Fecha: 24 de febrero de 2023
Fichero: Ejemplo usos.sql
****************************************************/

CREATE DATABASE IF NOT EXISTS Empresa_index;

USE Empresa_index;

# Para uso en AUTO_INCREMENT. Controla el número de saltos entre auto incremento
# Ejemplo: NombreCampo += 10
SET SESSION auto_increment_increment = 10;

# Para uso en AUTO_INCREMENT. Controla el valor de inicio para auto incremento
# Ejemplo: NombreCampo toma valor inicial 10
SET SESSION auto_increment_offset = 10;

/*************** *************** CREACIÓN TABLAS *************** ***************/

CREATE TABLE IF NOT EXISTS Departamentos (
    Dept_No INT AUTO_INCREMENT PRIMARY KEY,
    Dnombre VARCHAR(45) NOT NULL,
    Loc VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dirs (
    Codigo CHAR(4) PRIMARY KEY,
    Apellido VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Empleados (
    Emp_No CHAR(5) PRIMARY KEY,
    Apellido VARCHAR(20) NOT NULL,
    Oficio VARCHAR(20) NOT NULL,
    Dir CHAR(4),
    Fecha_Alt DATE NOT NULL,
    Salario INT NOT NULL,
    Comision INT,
    Dept_No INT NOT NULL,

    CONSTRAINT Fk_EmpDir FOREIGN KEY (Dir) REFERENCES Dirs(Codigo)
);
/*************** *************** FIN CREACIÓN TABLAS *************** ***************/


/*************** *************** INSERCIONES *************** ***************/

# Departamentos table data
# Se autoincrementa el primer campo
INSERT INTO Departamentos VALUES (NULL, 'CONTABILIDAD', 'SEVILLA');
INSERT INTO Departamentos VALUES (NULL, 'INVESTIGACIÓN', 'MADRID');
INSERT INTO Departamentos VALUES (NULL, 'VENTAS', 'BARCELONA');
INSERT INTO Departamentos VALUES (NULL, 'PRODUCCIÓN', 'BILBAO');

# Dirs table data
INSERT INTO Dirs VALUES ('7902', 'FERNÁNDEZ');
INSERT INTO Dirs VALUES ('7698', 'NEGRO');
INSERT INTO Dirs VALUES ('7839', 'REY');
INSERT INTO Dirs VALUES ('7566', 'JIMÉNEZ');
INSERT INTO Dirs VALUES ('7788', 'GIL');
INSERT INTO Dirs VALUES ('7782', 'ROBERTO');

# Empleados table data
/* NOTA: El formato correcto de fecha usado es YYYY-MM-DD donde YYYY representa el año,
MM representa el mes y DD representa el día */
INSERT INTO Empleados values('7369', 'SÁNCHEZ', 'EMPLEADO', '7902', '1980-12-17', 104000, NULL, 20);
INSERT INTO Empleados values('7499', 'ARROYO', 'VENDEDOR', '7698', '1980-02-20', 208000, 39000, 30);
INSERT INTO Empleados values('7521', 'SALA', 'VENDEDOR', '7698', '1981-02-22', 162500, 162500, 30);
INSERT INTO Empleados values('7566', 'JIMÉNEZ', 'DIRECTOR', '7839', '1981-04-02', 386750, NULL, 20);
INSERT INTO Empleados values('7654', 'MARTÍN', 'VENDEDOR', '7698', '1981-09-29', 162500, 182000, 30);
INSERT INTO Empleados values('7698', 'NEGRO', 'DIRECTOR', '7839', '1981-05-01', 370500, NULL, 30);
INSERT INTO Empleados values('7788', 'GIL', 'ANALISTA', '7566', '1981-11-09', 390000, NULL, 20);
INSERT INTO Empleados values('7839', 'REY', 'PRESIDENTE', NULL, '1981-11-17', 650000, NULL, 10);
INSERT INTO Empleados values('7844', 'TOVAR', 'VENDEDOR', '7698', '1981-09-08', 195000, 0, 30);
INSERT INTO Empleados values('7876', 'ALONSO', 'EMPLEADO', '7788', '1981-09-23', 143000, NULL, 20);
INSERT INTO Empleados values('7900', 'JIMENO', 'EMPLEADO', '7698', '1981-12-03', 1235000, NULL, 30);
INSERT INTO Empleados values('7902', 'FERNÁNDEZ', 'ANALISTA', '7566', '1981-12-03', 390000, NULL, 20);
INSERT INTO Empleados values('7934', 'MUÑOZ', 'EMPLEADO', '7782', '1982-01-23', 169000, NULL, 10);
/*************** *************** FIN INSERCIONES *************** ***************/

/****************************************************
Queries Auxiliares
****************************************************/

# Consulta el estado de las variables de la conexión actual
# que contengan la cadena 'auto_inc' en su nombre. Si las variables encontradas no tienen valor
# en la conexión actual, se muestra el valor global.
# Src: https://dev.mysql.com/doc/refman/5.7/en/show-status.html
SHOW SESSION VARIABLES LIKE '%auto_inc%';


/* EJEMPLOS UTILIZACIÓN ÍNDICES */
-- Seleccionar líneas 105 a 123 y ejecutar con el icono de rayito en Workbench
-- Los timpos de ejecución se muestran en segundos 

-- Craeción de un índice
CREATE UNIQUE INDEX Idx_EmpNo ON Empleados (Emp_No);
DESCRIBE Empleados;

-- IMPORTANT: Enable profiling (Profiling is disabled by default)
SET profiling = 1;

-- Query de búsqueda del empleado con número de empleado '7900'
SELECT * 
FROM Empleados
WHERE Emp_No = '7900';

-- Query de búsqueda del empleado con número de empleado '7900' usando índice
SELECT * 
FROM Empleados USE INDEX (Idx_EmpNo)
WHERE Emp_No = '7900';

-- Muestra ID de query, duración en segundos y la query en cuestión
SHOW PROFILES;

-- Eliminación de un índice
ALTER TABLE Empleados
DROP INDEX Idx_EmpNo;

# Limpieza
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Dirs;
DROP TABLE IF EXISTS Departamentos;
DROP DATABASE IF EXISTS Empresa_index;