-- 1. Crear la base de datos dbGamarraMarket

/* Crear la base de datos dbGamarraMarket */
DROP DATABASE IF EXISTS dbGamarraMarket;
CREATE DATABASE dbGamarraMarket DEFAULT CHARACTER SET utf8;

-- Poner en uso la base de datos creada
USE dbGamarraMarket;


/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE (
    id INT,                          
    tipo_documento CHAR(3),          
    numero_documento CHAR(9),       
    nombres VARCHAR(60),            
    apellidos VARCHAR(90),          
    email VARCHAR(80),              
    celular CHAR(9),              
    fecha_nacimiento DATE,          
    activo BOOL,                     
    CONSTRAINT cliente_pk PRIMARY KEY (id)  
);

-- Verificar la estructura de la tabla CLIENTE
SHOW COLUMNS IN CLIENTE;


/* Listar todas las tablas en la base de datos activa */
SHOW TABLES;

/* Agregar una nueva columna 'estado_civil' a la tabla CLIENTE */
ALTER TABLE CLIENTE
    ADD COLUMN estado_civil CHAR(1);

-- Eliminar la columna
ALTER TABLE CLIENTE
    DROP COLUMN fecha_nacimiento;

-- Eliminar la tabla CLIENTE
DROP TABLE CLIENTE;

-- Crear la tabla VENTA

/* Crear la tabla VENTA */
CREATE TABLE VENTA (
    id INT AUTO_INCREMENT,      
    cliente_id INT,            
    fecha DATE,                 
    total DECIMAL(10, 2),         
    PRIMARY KEY (id)            
);

-- Verificar las tablas en la base de datos activa
SHOW TABLES;

-- Verificar la estructura de la tabla VENTA
SHOW COLUMNS IN VENTA;


/* Crear la relación VENTA_CLIENTE entre las tablas VENTA y CLIENTE */
ALTER TABLE VENTA
    ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE (id)
    ON UPDATE CASCADE
    ON DELETE CASCADE;


/* Listar relaciones de tablas de la base de datos activa */
SELECT 
    i.constraint_name, 
    k.table_name, 
    k.column_name, 
    k.referenced_table_name, 
    k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();


/* Eliminar la relación VENTA_CLIENTE */
ALTER TABLE VENTA
    DROP CONSTRAINT VENTA_CLIENTE;


-- Listar las tablas creadas en la base de datos
SHOW TABLES;

-- Verificar la estructura de la tabla CLIENTE 
SHOW COLUMNS IN CLIENTE;

-- Listar las relaciones de las tablas en la base de datos
SELECT 
    i.constraint_name, 
    k.table_name, 
    k.column_name, 
    k.referenced_table_name, 
    k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();