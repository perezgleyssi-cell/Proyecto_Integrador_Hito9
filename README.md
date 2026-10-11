# Sistema de Matrícula - Proyecto Integrador I

UNAN-León · Ingeniería en Sistemas de Información · Hito 9

Propuesta académica de matrícula basada en el ejemplo de la clase. Los datos del prototipo son ficticios. Número de equipo: pendiente de confirmar. Integrantes: Gleyssi Nereyda Barrera Perez, Andy Dayana Hernandez Arrieta, Jeisling Maria Muños Vallejo y Alexandra Paola Lira Blandon.

## Prototipo

https://www.figma.com/design/YlSnNloiDYtkuojdrUjIkb

12 marcos editables: acceso, tablero, matrícula, asignaturas, confirmación, comprobante, reportes, edición, eliminación, galería de estados y dos marcos de documentación. La persistencia se simula en el prototipo.

Recorrido comprobado en Presentar: acceso → tablero → matrícula → asignaturas → confirmación → comprobante → reportes. También se verificó la edición y su retorno, cancelar eliminación, volver al tablero y cerrar sesión. Campos, filtros, paginación y exportación son representaciones visuales estáticas.

## Estructura

```text
proyecto-integrador/
  docs/                  DER, DDL original, wireframes y manuales
  src/
    presentation/        Vistas y validación de formatos
    business/            Controladores, servicios y reglas
    data/                Repositorios y conexión a MySQL
  tests/                 Pruebas por capa
  .gitignore
  README.md
```

## Preparación

Este hito entrega el armazón del repositorio; todavía no es una aplicación ejecutable. Clonar o descomprimir el proyecto, elegir el lenguaje del equipo y colocar el DER y el DDL originales de clase 8 en docs/. No usar un esquema inventado como sustituto del entregable anterior. Implementar la conexión real durante el siguiente hito.

## Arquitectura

La presentación captura eventos y envía DTO/JSON al controlador. El servicio de negocio valida solvencia, cupo, período habilitado y ausencia de duplicados. El repositorio usa consultas preparadas y una transacción para persistir cabecera y detalles. Los resultados regresan por negocio a la vista. Solo data/ conoce SQL y credenciales.

## Verificación del prototipo

1. Probar acceso válido, campos vacíos y credenciales incorrectas.
2. Abrir Nueva matrícula desde el tablero y cancelar para volver.
3. Completar estudiante, carrera, período y asignaturas; revisar cupo y solvencia.
4. Confirmar, revisar comprobante y abrir reportes.
5. Probar búsqueda, filtros, paginación, exportación y navegación lateral.
6. Revisar estados de error, carga, vacío y éxito.

## Control de versiones

Usar commits semánticos: docs:, feat:, fix: y refactor:. Cada integrante debe aportar sus propios commits. Configurar el remoto real del equipo antes de hacer push. No publicar contraseñas ni archivos .env.

## Pendientes para la entrega oficial

- Verificar campos y claves foráneas contra el DER y DDL originales.
- Confirmar número de equipo para la portada.
- Crear o vincular el repositorio remoto en la cuenta autorizada y hacer el primer push.
- Comprobar el enlace desde una cuenta externa. Figma muestra acceso de lectura para cualquiera con el enlace; la memoria ya incluye capturas.
- Entregar en Moodle antes de clase 10 con el nombre PI1_Hito9_EquipoN.pdf, sustituyendo N por el número real.
