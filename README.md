# Sistema de fallas de equipos de cómputo

UNAN-León · Proyecto Integrador I · Hito 9 · CTIS25-SABE2-GP2

Integrantes: Gleyssi Nereyda Barrera Perez, Andy Dayana Hernandez Arrieta, Jeisling Maria Muños Vallejo y Alexandra Paola Lira Blandon.

## Entregables
- Figma: https://www.figma.com/design/YlSnNloiDYtkuojdrUjIkb?node-id=6-5
- Abrir la página **Sistema de Fallas · Hito 9**. El ejemplo anterior de matrícula queda en Page 1 como referencia.
- Diez pantallas editables con escudo UNAN-León, grupo, navegación principal, acceso con error, validación y consulta vacía.
- docs/wireframes: fuentes SVG de las diez pantallas; docs/evidencias: capturas de Figma.
- docs/Modelo_original_clase8.pdf: modelo recuperado de la entrega real de Classroom.
- docs/schema_derivado_clase8.sql: DDL MySQL derivado del diccionario, identificado como tal; no se encontró un SQL original en el adjunto.
- docs/PI1_Hito9_Memoria.docx y PDF: memoria con arquitectura, modelo y evidencias.

## Estructura
```
docs/
src/presentation/
src/business/
src/data/
tests/
.gitignore
README.md
```

Este repositorio entrega el armazón solicitado para Hito 9. Los .gitkeep conservan carpetas vacías; no son código ejecutable. La implementación y conexión real corresponden al siguiente hito.

## Recorrido del prototipo
Acceso → Tablero → Reportar una falla → Reporte registrado → Seguimiento → Registrar solución → Consultar reportes. Aplicar filtros muestra el ejemplo vacío y Limpiar filtros regresa. Los campos y datos son simulados. Los marcos de error ilustran las validaciones previstas; se pueden revisar directamente en Figma. No autentican ni guardan datos reales.

## Preparación del siguiente hito
1. Clonar este repositorio y elegir la tecnología del equipo.
2. Revisar docs/ARQUITECTURA.md y cotejar el SQL derivado con el documento original.
3. Crear una base vacía y seleccionar explícitamente su nombre antes de ejecutar el DDL con MySQL 8.0.16 o posterior. El script no contiene DROP ni credenciales.
4. Implementar vistas, servicios y repositorios por separado; usar consultas preparadas y variables de entorno.

## Verificación y colaboración
La navegación del prototipo se comprueba en Presentar. El DDL se revisó contra las ocho entidades del diccionario; no se ha ejecutado en MySQL. Cada integrante deberá aportar sus propios commits; no se simulan colaboraciones. Conservar el historial y usar mensajes docs:, feat: o fix:.

## Entrega académica
La memoria incluye enlaces a Figma y GitHub. El número de equipo para el nombre PI1_Hito9_EquipoN.pdf debe confirmarse: GP2 identifica el grupo y no prueba el número de equipo. La entrega en Moodle y los commits individuales corresponden al equipo.
