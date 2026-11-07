# Actividad 1. Informe estadístico de un caso de estudio

Enunciado, datos y rúbrica de la Actividad 1 de Métodos y Simulación Estadística. Corresponde a la Unidad 1.

## Archivos

- `index.Rmd`: enunciado de la actividad, con la tabla de variables, los requisitos, las condiciones de entrega y la rúbrica.
- `data/datos_actividad1.xlsx`: base que usan los estudiantes. Se publica junto con el enunciado.
- `crear_datos.R`: construye `data/datos_actividad1.xlsx` a partir de la base original. Explica cada cambio.
- `fuente/data_actividad1_original.xlsx`: base original, con los nombres en inglés. No se publica.
- `_site.yml`: genera el sitio en `../docs/actividad1`.
- `style.css`: estilos, iguales a los de la Unidad 1.

## Cómo generar el sitio

1. Abra `Actividad1.Rproj` en RStudio.
2. Si cambia la base, ejecute `source("crear_datos.R")`. Necesita los paquetes `readxl` y `writexl`.
3. Use **Build > Render Website**, o ejecute `rmarkdown::render_site()`.
4. Abra `../docs/actividad1/index.html` en el navegador.
