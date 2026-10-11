# Arquitectura y trazabilidad

## Dependencias

Presentación → Negocio → Datos → MySQL. Las respuestas recorren la ruta inversa. La vista nunca se conecta al SGBD.

## Contrato de registro propuesto

Solicitud: estudianteId, periodoId, asignaturaIds. El servidor obtiene carrera y situación financiera del estudiante, sin confiar en valores manipulables de la vista. Los identificadores apuntan a catálogos. Los nombres definitivos se deben alinear con el DER anterior.

El controlador traduce la solicitud en un DTO y llama al servicio. El servicio valida existencia del estudiante, período abierto, solvencia, duplicados y cupos. La capa de datos confirma el cupo dentro de una transacción con el mecanismo de concurrencia del SGBD, registra matrícula y detalles y confirma o revierte todo. Devuelve identificador y comprobante. La vista muestra un mensaje comprensible sin revelar errores SQL.

## Reglas de módulos

- presentation/: campos requeridos, correo válido y renderizado; sin SQL ni credenciales.
- business/: autenticación delegada al proveedor seguro, autorización por rol, cupo, solvencia y orquestación; sin detalles de conexión.
- data/: repositorios, conexiones por entorno, consultas preparadas y atomicidad.
- tests/: pruebas de reglas y contratos, y pruebas de integración de repositorios en una base aislada.

## Seguridad prevista

Contraseñas con hash seguro en la implementación, HTTPS, sesión con expiración, autorización en servidor, validación de entradas y consultas parametrizadas. El prototipo no autentica usuarios reales ni almacena contraseñas.

## Matriz del Hito 9

Wireframes (25 puntos): cuatro pantallas, jerarquía, cuadrícula de 8 px y validaciones. Interactividad (25): conexiones clicables del flujo. Tres capas (25): separación física y responsabilidades. Git (25): remoto activo, README, .gitignore y aportes colaborativos. La existencia de carpetas locales no demuestra un remoto ni colaboración.
