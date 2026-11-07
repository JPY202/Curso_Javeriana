# Métodos y Simulación Estadística: Unidad 1

Unidad 1 en R Markdown. Cada archivo `.Rmd` genera una página HTML en la carpeta `docs/`.

## Cómo generar los HTML

1. Abra `Unidad1.Rproj` en RStudio.
2. Instale los paquetes una sola vez: `install.packages(c("rmarkdown", "ggplot2", "kableExtra", "formattable", "summarytools", "e1071", "fmsb", "wordcloud", "readr", "readxl", "haven", "jsonlite", "dplyr", "tidyr", "scales", "mice"))`.
3. Use **Build > Render Website** o ejecute `source("render.R")`.
4. Abra `../docs/unidad1/index.html` en el navegador.

## Estructura de cada página

1. Encabezado YAML y primer bloque `setup`, iguales en todas las páginas.
2. Introducción sin título: qué es el tema y qué problema resuelve.
3. Secciones del tema con `##`, escritas como preguntas, con signos ¿?, y separadas con `<br/>`.
4. `## Errores frecuentes`: tabla con Problema, Causa y Solución.
5. `## Retos`: cajas `content-box-yellow`, tituladas Reto 1, Reto 2, etc., con la solución oculta en `<details>`.
6. `## Libros y recursos`.
7. `## Referencias`: fuentes usadas en la página.
8. Fecha de la última revisión.

Las notas van en cajas `content-box-gray`. Las figuras se hacen en R y muestran su código. Los ejes de cada gráfico deben contener todas las barras y datos. Cada libro citado lleva un enlace, y cada página incluye libros descargables desde su fuente oficial.

## Contenido

- `index.Rmd`: portada con el contenido de la unidad.
- `recurso100.Rmd` a `recurso107.Rmd`: Software R.
- `recurso200.Rmd`: página Conceptos básicos.
- `recurso201.Rmd`: página Tablas de frecuencia.
- `recurso202.Rmd`: página Indicadores estadísticos.
- `recurso203.Rmd`: página Indicadores de centro.
- `recurso204.Rmd`: página Indicadores de posición.
- `recurso205.Rmd`: página Indicadores de dispersión.
- `recurso206.Rmd`: página Indicadores de forma.
- `recurso300.Rmd`: página ¿Qué es un gráfico?
- `recurso301.Rmd`: página ¿Qué tipos de gráficos existen?
- `recurso302.Rmd`: página ¿Cómo graficar variables categóricas?
- `recurso303.Rmd`: página ¿Cómo graficar una variable numérica?
- `recurso304.Rmd`: página ¿Cómo graficar relaciones y cambios en el tiempo?
- `recurso305.Rmd`: página ¿Qué otros gráficos existen?
- `recurso306.Rmd`: página ¿Qué hace bueno a un gráfico?
- `recurso400.Rmd`: página ¿Cómo importar datos?
- `recurso401.Rmd`: página ¿Cómo organizar los datos?
- `recurso402.Rmd`: página ¿Cómo tratar los datos faltantes?
- `recurso403.Rmd`: página ¿Cómo transformar variables?
- `recurso50a.Rmd`, `recurso51a.Rmd` y `recurso52a.Rmd`: Casos e informe, con el texto del sitio original en el formato del proyecto.
- `recurso60a.Rmd`: Referencias.
- `data/ejemplos/`: archivos de ejemplo para importar.
- `img/`: imágenes.
- `data/`: copias de `CarreraLuz22` y `vivienda_faltantes`, del paquete `paqueteMETODOS`, para generar el sitio sin instalar el paquete.
- `style.css`: estilos del sitio.
- `_site.yml`: menú del sitio.
- `docs/`: HTML generados. No se editan a mano.

## Código y salidas

El código y las salidas de **R** van en bloques separados (`collapse = FALSE` en el bloque `setup` de cada página). `style.css` los distingue con las etiquetas Código R y Salida.
