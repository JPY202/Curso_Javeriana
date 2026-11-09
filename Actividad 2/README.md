# Actividad 2. Decisiones con probabilidad, simulación e inferencia

Enunciado, datos y rúbrica de la Actividad 2 de Métodos y Simulación Estadística. Corresponde a la Unidad 2.

## Archivos

- `index.Rmd`: enunciado, con el caso, los datos, los cuatro problemas, las páginas del curso que sirven, las condiciones de entrega y la rúbrica.
- `data/datos_actividad2.xlsx`: datos que usan los estudiantes, en dos hojas: `pedidos` (10,000 pedidos del tercer trimestre de 2026, con 11 variables) y `pedidos_hora` (pedidos por hora los viernes de 6 a 11 p. m., en 52 semanas y cuatro zonas; 1,040 filas). Se publica junto con el enunciado.
- `crear_datos.R`: genera `data/datos_actividad2.xlsx` con `set.seed(2026)`. Los datos son simulados y el caso es ficticio.
- `_site.yml`: genera el sitio en `../docs/actividad2`.
- `style.css`: estilos, iguales a los de la Actividad 1.

## Cómo generar el sitio

1. Abra `Actividad2.Rproj` en RStudio.
2. Si cambia los datos, ejecute `source("crear_datos.R")`. Necesita el paquete `writexl`.
3. Use **Build > Render Website**, o ejecute `rmarkdown::render_site()`.

## Solución

La solución de referencia se guarda fuera de este repositorio, para que los estudiantes no la vean.
