-- Ejercicio 1 – Crear Base de Datos
-- Crear una base de datos llamada veterinaria_patitas_felices.

CREATE DATABASE veterinaria_patitas_felices;
USE veterinaria_patitas_felices;


-- Ejercicio 2 – Crear tabla duenos
-- Crear la tabla duenos con las siguientes columnas:
/* Columna Tipo Restricciones
id INT PRIMARY KEY, AUTO_INCREMENT
nombre VARCHAR(50) NOT NULL
apellido VARCHAR(50) NOT NULL
telefono VARCHAR(20) NOT NULL
direccion VARCHAR(100) */

CREATE TABLE duenos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);



-- Ejercicio 3 – Crear tabla mascotas
-- Crear la tabla mascotas con las siguientes columnas:
/* Columna Tipo Restricciones
id INT PRIMARY KEY, AUTO_INCREMENT
nombre VARCHAR(50) NOT NULL
especie VARCHAR(30) NOT NULL
fecha_nacimiento DATE
id_dueno INT FOREIGN KEY → duenos.id */

CREATE TABLE mascotas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY(id_dueno) REFERENCES duenos(id)
);


-- Ejercicio 4 – Crear tabla veterinarios
-- Crear la tabla veterinarios con las siguientes columnas:
/* Columna Tipo Restricciones
id INT PRIMARY KEY, AUTO_INCREMENT
nombre VARCHAR(50) NOT NULL
apellido VARCHAR(50) NOT NULL
matricula VARCHAR(20) NOT NULL, UNIQUE
especialida
d
VARCHAR(50) NOT NULL */

CREATE TABLE veterinarios (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);



-- Ejercicio 5 – Crear tabla historial_clinico
-- Crear la tabla historial_clinico con las siguientes columnas:
/* Columna Tipo Restricciones
id INT PRIMARY KEY, AUTO_INCREMENT
id_mascota INT FOREIGN KEY → mascotas.id
id_veterinario INT FOREIGN KEY → veterinarios.id
fecha_registro DATETIME NOT NULL, DEFAULT CURRENT_TIMESTAMP
descripcion VARCHAR(250) NOT NULL */

CREATE TABLE historial_clinico (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    FOREIGN KEY(id_mascota) REFERENCES mascotas(id),
    FOREIGN KEY(id_veterinario) REFERENCES veterinarios(id)
);



-- Ejercicio 6 – Insertar registros
/* Insertar:
● 3 dueños con información completa
● 3 mascotas, cada una asociada a un dueño
● 2 veterinarios con especialidades distintas
● 3 registros de historial clínico
 */

INSERT INTO duenos (nombre, apellido, telefono, direccion) VALUES
('Lionel', 'Messi', '1010101010', 'Rosario 123'),
('Emma','Watson','12345678', 'Harry Potter 1378'),
('Paul','McCartney','87654321','The Beatles 4321');


INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno) VALUES
('Chiquitapia', 'Perro', '2022-12-18', 1),
('Ron','Perro','2004-07-03', 2),
('Penny','Gato', '2024-10-09',3); 

INSERT INTO veterinarios (nombre, apellido, matricula, especialidad) VALUES
('Ezequiel', 'Robles', '32', 'Perros'),
('Solana','Zapatta', '29', 'Gatos');

INSERT INTO historial_clinico (id_mascota, id_veterinario, fecha_registro, descripcion) VALUES
(1, 1, '2025-04-18', 'Control anual'),
(2, 1, '2025-11-02', 'Dolor de patita'),
(2,2,'2025-11-17','Vacunación');



-- Ejercicio 7 – Actualizar registros
/* Realizar las siguientes actualizaciones:
1. Cambiar la dirección de un dueño (por ID o nombre).
2. Actualizar la especialidad de un veterinario (por ID o matrícula).
3. Editar la descripción de un historial clínico (por ID). */

UPDATE duenos
SET direccion = "Campeones Del Mundo 2022"
WHERE id = 1;


UPDATE veterinarios
SET especialidad = "Perros"
WHERE matricula = "29";

UPDATE historial_clinico
SET descripcion = "Castración"
WHERE id = 3;



--Ejercicio 8 – Eliminar registros
/* 1. Eliminar una mascota (por ID o nombre).
2. Verificar que se eliminen automáticamente los registros del historial clínico asociados
(ON DELETE CASCADE). */









--Ejercicio 9 – JOIN simple
/* Consulta que muestre:
● Nombre de la mascota
● Especie
● Nombre completo del dueño (nombre + apellido) */






--Ejercicio 10 – JOIN múltiple con historial
/* Consulta que muestre todas las entradas del historial clínico con:
● Nombre y especie de la mascota
● Nombre completo del dueño
● Nombre completo del veterinario
● Fecha de registro
● Descripción
Ordenados por fecha de registro descendente (DESC). */