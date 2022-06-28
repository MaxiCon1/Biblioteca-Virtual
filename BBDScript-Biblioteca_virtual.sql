DROP DATABASE biblioteca;
CREATE DATABASE biblioteca CHARACTER SET utf8mb4;
USE biblioteca;

CREATE TABLE usuarios(
id_usuario INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido1 VARCHAR(30) NOT NULL,
apellido2 VARCHAR(30),
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(9),
fecha_nacimiento DATE NOT NULL,
sexo ENUM('M','F') NOT NULL,

username VARCHAR(18) NOT NULL,
-- salted pasword
pasword VARCHAR(18) NOT NULL,
email VARCHAR(50) NOT NULL,
lastLogin DATETIME,
fecha_registro DATE NOT NULL,
fecha_baja DATE NOT NULL
);

CREATE TABLE socios(
id_socio INT UNSIGNED PRIMARY KEY,
FOREIGN KEY (id_socio) REFERENCES usuarios(id_usuario)
);

CREATE TABLE admins(
id_admin INT UNSIGNED PRIMARY KEY,
FOREIGN KEY (id_admin) REFERENCES usuarios(id_usuario)
);

CREATE TABLE cuotas(
id_cuota INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
precio FLOAT NOT NULL,
pagado BOOLEAN NOT NULL,
fecha DATE NOT NULL,
id_socio INT UNSIGNED NOT NULL,
FOREIGN KEY (id_socio) REFERENCES socios(id_socio)
);

CREATE TABLE libros(
id_libro INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
categoria ENUM('fantasia', 'ciencia-ficcion', 'educacion', 'romantico', 'otros'),
autor VARCHAR(50) NOT NULL,
fechaPublicacion DATE NOT NULL,
puntuacion TINYINT
);

CREATE TABLE descargas(
id_descarga INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
fecha DATE NOT NULL,
id_libro INT UNSIGNED NOT NULL, 
id_socio INT UNSIGNED NOT NULL,
FOREIGN KEY (id_socio) REFERENCES socios(id_socio),
FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);



