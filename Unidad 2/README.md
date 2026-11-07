# Métodos y Simulación Estadística: Unidad 2

Unidad 2 en R Markdown. Cada archivo `.Rmd` genera una página HTML en la carpeta `../docs/unidad2/`.

## Cómo generar los HTML

1. Abra `Unidad2.Rproj` en RStudio.
2. Instale el paquete una sola vez: `install.packages("rmarkdown")`. Las páginas solo usan **R** base y la tabla `Titanic`, que viene con **R**.
3. Use **Build > Render Website** o ejecute `source("render.R")`.
4. Abra `../docs/unidad2/index.html` en el navegador.

## Estructura de cada página

Igual a la de la Unidad 1:

1. Encabezado YAML y primer bloque `setup`, iguales en todas las páginas.
2. Introducción sin título: qué es el tema y qué problema resuelve.
3. Secciones del tema con `##`, escritas como preguntas, con signos ¿?, y separadas con `<br/>`.
4. `## Errores frecuentes`: tabla con Problema, Causa y Solución.
5. `## Retos`: cajas `content-box-yellow`, tituladas Reto 1, Reto 2, etc., con la solución oculta en `<details>`.
6. `## Libros y recursos`, con libros que se leen o descargan gratis desde su fuente oficial.
7. `## Referencias`.
8. Fecha de la última revisión.

Las páginas siguen el nivel del sitio original de la Unidad 2 (metodosySIM2_V2): definiciones con ejemplos, sin demostraciones, y código en **R** sencillo. Toda simulación usa `set.seed(2026)`. El código y las salidas de **R** van en bloques separados (`collapse = FALSE` en el bloque `setup`); `style.css` los distingue con las etiquetas Código R y Salida.

## Contenido

- `index.Rmd`: portada con el contenido de la unidad.
- `recurso100.Rmd`: Espacio muestral y eventos.
- `recurso101.Rmd`: Enfoques y axiomas.
- `recurso102.Rmd`: Tipos de probabilidad (marginal, conjunta y condicional).
- `recurso103.Rmd`: Independencia.
- `recurso104.Rmd`: Teorema de Bayes.
- `recurso200.Rmd`: Variable aleatoria (discreta y continua, función de probabilidad, densidad y acumulada).
- `recurso201.Rmd`: Valor esperado y varianza.
- `recurso202.Rmd`: Variables conjuntas (marginales, condicionales, independencia, covarianza y correlación).
- `recurso203.Rmd`: Modelos discretos (Bernoulli, binomial, Poisson, hipergeométrico, geométrico y binomial negativo), con un gráfico interactivo.
- `recurso204.Rmd`: Modelos continuos (uniforme, normal, exponencial, gamma y Weibull), con un gráfico interactivo.
- `img/`: imágenes.
- `style.css`: estilos del sitio, copiados de la Unidad 1.
- `_site.yml`: menú del sitio.
