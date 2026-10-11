# Arquitectura de tres capas

Sistema para Reportar y Dar Seguimiento a Fallas de Equipos de Cómputo.
Grupo CTIS25-SABE2-GP2. Hito 9: prototipo y armazón de repositorio.

## Presentación
src/presentation contiene las futuras vistas de acceso, tablero, formulario y consulta. Captura equipo, categoría y descripción. Valida presencia y longitud de 300 caracteres, muestra errores y envía DTO al controlador. No ejecuta SQL.

## Negocio
src/business contiene los futuros controladores y servicios. Comprueba usuario activo, existencia del equipo y categoría, rol MANTENIMIENTO para seguimiento y solución, estado inicial Pendiente y transición a Resuelto. Una solución por reporte. Orquesta transacciones sin depender de la vista.

## Datos
src/data contiene los futuros repositorios y conexión. Realiza consultas parametrizadas a las ocho tablas, aplica PK, FK y UNIQUE, y persiste solución y cambio de estado en la misma transacción. Las credenciales se cargarán desde variables de entorno excluidas de Git.

## Flujo de registrar una falla
Vista → DTO {equ_id, cat_id, rep_descripcion} → controlador → servicio → repositorio → MySQL. usu_id se toma de la sesión; rep_fecha y estado se asignan en servidor. La respuesta vuelve a la vista con rep_id o un error comprensible.

## Modelo y decisiones
Modelo_original_clase8.pdf es el documento realmente entregado en Classroom. schema_derivado_clase8.sql es una traducción nueva del diccionario, no el DDL original. Los estados se inicializan con Pendiente=1. La autenticación deberá integrarse porque TBL_USUARIO no incluye contraseña. Las FK impiden eliminar referencias utilizadas. No se agrega prioridad: ese atributo no figura en el modelo.

## Alcance
El prototipo simula navegación y datos. Este hito no contiene una aplicación ejecutable ni una conexión real. El siguiente hito implementará y probará los servicios.
