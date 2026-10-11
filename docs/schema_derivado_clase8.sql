-- Sistema de fallas de equipos de cómputo | CTIS25-SABE2-GP2
-- MySQL 8.0.16 o posterior. DDL derivado del diccionario entregado en clase 8.
-- No es una copia de un script SQL original: el adjunto recuperado es un PDF.
-- Ejecutar en una base vacía seleccionada por el equipo. Sin credenciales.
CREATE TABLE TBL_USUARIO (
 usu_id INT AUTO_INCREMENT PRIMARY KEY,
 usu_codigo VARCHAR(15) NOT NULL UNIQUE,
 usu_nombre_completo VARCHAR(100) NOT NULL,
 usu_correo VARCHAR(80) NOT NULL UNIQUE,
 usu_telefono VARCHAR(15),
 usu_rol ENUM('ESTUDIANTE','DOCENTE','MANTENIMIENTO') NOT NULL DEFAULT 'ESTUDIANTE'
);
CREATE TABLE TBL_LABORATORIO (
 lab_id INT AUTO_INCREMENT PRIMARY KEY,
 lab_nombre VARCHAR(60) NOT NULL,
 lab_edificio VARCHAR(60) NOT NULL,
 lab_capacidad INT CHECK (lab_capacidad >= 0)
);
CREATE TABLE TBL_EQUIPO (
 equ_id INT AUTO_INCREMENT PRIMARY KEY,
 equ_codigo_inventario VARCHAR(20) NOT NULL UNIQUE,
 equ_tipo ENUM('PC','IMPRESORA','PROYECTOR','SWITCH','OTRO') NOT NULL,
 equ_marca VARCHAR(40), equ_modelo VARCHAR(40),
 equ_estado ENUM('OPERATIVO','EN_REPARACION','DE_BAJA') NOT NULL DEFAULT 'OPERATIVO',
 lab_id INT NOT NULL,
 FOREIGN KEY (lab_id) REFERENCES TBL_LABORATORIO(lab_id)
);
CREATE TABLE TBL_CATEGORIA_FALLA (
 cat_id INT AUTO_INCREMENT PRIMARY KEY,
 cat_nombre VARCHAR(40) NOT NULL UNIQUE,
 cat_descripcion VARCHAR(150)
);
CREATE TABLE TBL_ESTADO_FALLA (
 est_id INT AUTO_INCREMENT PRIMARY KEY,
 est_nombre VARCHAR(30) NOT NULL UNIQUE
);
INSERT INTO TBL_ESTADO_FALLA (est_id,est_nombre) VALUES
 (1,'Pendiente'),(2,'En proceso'),(3,'Resuelto'),(4,'Cancelado');
CREATE TABLE TBL_REPORTE_FALLA (
 rep_id INT AUTO_INCREMENT PRIMARY KEY,
 rep_fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 rep_descripcion VARCHAR(300) NOT NULL,
 usu_id INT NOT NULL, equ_id INT NOT NULL, cat_id INT NOT NULL,
 est_id INT NOT NULL DEFAULT 1,
 FOREIGN KEY (usu_id) REFERENCES TBL_USUARIO(usu_id),
 FOREIGN KEY (equ_id) REFERENCES TBL_EQUIPO(equ_id),
 FOREIGN KEY (cat_id) REFERENCES TBL_CATEGORIA_FALLA(cat_id),
 FOREIGN KEY (est_id) REFERENCES TBL_ESTADO_FALLA(est_id)
);
CREATE TABLE TBL_SEGUIMIENTO (
 seg_id INT AUTO_INCREMENT PRIMARY KEY,
 rep_id INT NOT NULL, usu_id_personal INT NOT NULL,
 seg_fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 seg_comentario VARCHAR(300) NOT NULL, est_id INT NOT NULL,
 FOREIGN KEY (rep_id) REFERENCES TBL_REPORTE_FALLA(rep_id),
 FOREIGN KEY (usu_id_personal) REFERENCES TBL_USUARIO(usu_id),
 FOREIGN KEY (est_id) REFERENCES TBL_ESTADO_FALLA(est_id)
);
CREATE TABLE TBL_SOLUCION (
 sol_id INT AUTO_INCREMENT PRIMARY KEY,
 rep_id INT NOT NULL UNIQUE, usu_id_personal INT NOT NULL,
 sol_fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 sol_descripcion VARCHAR(300) NOT NULL,
 sol_tiempo_horas DECIMAL(5,2) CHECK (sol_tiempo_horas >= 0),
 FOREIGN KEY (rep_id) REFERENCES TBL_REPORTE_FALLA(rep_id),
 FOREIGN KEY (usu_id_personal) REFERENCES TBL_USUARIO(usu_id)
);
-- El servicio de negocio comprobará el rol MANTENIMIENTO y las transiciones
-- de estado. Insertar solución + actualizar estado debe ser una transacción.
-- El modelo original no incluye contraseña: integrar autenticación segura.
