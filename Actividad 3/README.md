# Actividad 3. ¿Cuánto tiempo prometerle al cliente?

Enunciado, datos y rúbrica de la Actividad 3 de Métodos y Simulación Estadística. Corresponde a la Unidad 3 y es la actividad con evidencia de uso de inteligencia artificial del curso.

## Archivos

- `index.Rmd`: enunciado, con el caso, los datos, los seis problemas, las páginas del curso que sirven, las condiciones de entrega (incluida la declaración de uso de IA) y la rúbrica.
- `data/datos_actividad3.xlsx`: datos que usan los estudiantes, en la hoja `pedidos` (1,500 pedidos entregados en moto en octubre de 2026, con 5 variables). Se publica junto con el enunciado.
- `crear_datos.R`: genera `data/datos_actividad3.xlsx` con `set.seed(2026)`. Los datos son simulados y el caso es ficticio. La varianza del tiempo crece con la distancia y hay 9 errores de registro sembrados: 6 distancias en 0 y 3 con el punto decimal corrido.
- `_site.yml`: genera el sitio en `../docs/actividad3`.
- `style.css`: estilos, iguales a los de las Actividades 1 y 2.

## Cómo generar el sitio

1. Abra `Actividad3.Rproj` en RStudio.
2. Si cambia los datos, ejecute `source("crear_datos.R")`. Necesita el paquete `writexl`.
3. Use **Build > Render Website**, o ejecute `rmarkdown::render_site()`.

## Solución

La solución de referencia se guarda fuera de este repositorio, para que los estudiantes no la vean.
