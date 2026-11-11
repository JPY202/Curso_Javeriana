# Métodos y Simulación Estadística: Unidad 3

Unidad 3 en R Markdown: correlación y regresión lineal simple. Cada archivo `.Rmd` genera una página HTML en la carpeta `../docs/unidad3/`.

## Cómo generar los HTML

1. Abra `Unidad3.Rproj` en RStudio.
2. Instale los paquetes una sola vez: `install.packages(c("rmarkdown", "lmtest", "sandwich"))`. `MASS` viene instalado con **R**.
3. Use **Build > Render Website** o ejecute `source("render.R")`.
4. Abra `../docs/unidad3/index.html` en el navegador.

## Estructura de cada página

Igual a la de las Unidades 1 y 2:

1. Encabezado YAML y primer bloque `setup`, iguales en todas las páginas.
2. Introducción sin título: qué es el tema y qué problema resuelve.
3. Secciones del tema con `##`, escritas como preguntas, con signos ¿?, y separadas con `<br/>`.
4. `## Errores frecuentes`: tabla con Problema, Causa y Solución.
5. `## Retos`: cajas `content-box-yellow`, tituladas Reto 1, Reto 2, etc., con la solución oculta en `<details>`.
6. `## Libros y recursos`, con libros que se leen o descargan gratis desde su fuente oficial.
7. `## Referencias`.
8. Fecha de la última revisión.

El código y las salidas de **R** van en bloques separados (`collapse = FALSE`). Toda simulación usa `set.seed(2026)`. Las cifras del texto se calculan con código en línea, para que coincidan siempre con las salidas. Los gráficos usan **R** base.

## Datos

- `data/grasa.csv`: 252 hombres con el porcentaje de grasa corporal (ecuación de Brozek) y 14 medidas del cuerpo. Copia de `fat` del paquete `faraway`, con el peso pasado a kg y la estatura a cm. Se conservan dos errores conocidos de la base para usarlos en clase: el hombre 42 (estatura de 74.9 cm) y el hombre 182 (0 % de grasa). Fuente: Penrose, Nelson y Fisher (1985); Johnson (1996).
- `data/paises.csv`: 213 países y territorios con fecundidad, PIB por habitante, población urbana y esperanza de vida de las mujeres. Copia de `UN` del paquete `carData`; 14 territorios no tienen datos.
- `data/peso.csv`: 200 personas que hacen ejercicio con regularidad, con peso y estatura medidos y reportados. Copia de `Davis` del paquete `carData` (Davis, 1990). Se conserva el error de la persona 12 (peso y estatura digitados al revés), que el caso integrador corrige.
- `data/condenas.csv`: tasa de condenas de mujeres en Canadá, fecundidad y participación laboral, 1931 a 1968. Copia de `Hartnagel` del paquete `carData`.

## Contenido

- `index.Rmd`: portada, datos, temas previos, notación y diagnóstico.
- `recurso100.Rmd`: Correlación de Pearson (covarianza, correlación, cuarteto de Anscombe, prueba y matriz de correlaciones).
- `recurso101.Rmd`: Correlación de Spearman y Kendall (relaciones monótonas, rangos, pares concordantes).
- `recurso200.Rmd`: Modelo de regresión lineal simple (interpretación, supuestos, centrar $x$, extrapolación y causalidad).
- `recurso201.Rmd`: Estimación de los coeficientes (mínimos cuadrados, $\hat{\sigma}^2$, máxima verosimilitud, salida de `summary()`; ecuaciones normales como recuadro opcional).
- `recurso202.Rmd`: Propiedades de los estimadores (insesgadez y varianza por simulación, diseño de $x$, Gauss-Markov).
- `recurso300.Rmd`: Pruebas, intervalos y R² (prueba $t$, IC de los coeficientes y de $\sigma^2$, tabla ANOVA, $F = t^2$, $R^2$).
- `recurso301.Rmd`: Estimación de la media y predicción (intervalo para la media, intervalo de predicción, bandas, extrapolación).
- `recurso400.Rmd`: Supuestos del modelo (qué pasa si falla cada uno, simulación de cobertura, patrones de residuales, independencia y diseño).
- `recurso401.Rmd`: Revisión de los supuestos (residuales, gráficos, falta de ajuste, Breusch-Pagan, Shapiro-Wilk, Durbin-Watson y el efecto de una observación).
- `recurso500.Rmd`: Transformaciones (logaritmos y su interpretación, Box-Cox, retransformación, términos cuadráticos).
- `recurso501.Rmd`: Varianza no constante (errores estándar robustos y mínimos cuadrados ponderados).
- `recurso600.Rmd`: Puntos atípicos e influyentes (apalancamiento, residual estudentizado, Cook, DFBETAS, qué hacer), con un gráfico interactivo que reemplaza el tablero Shiny del sitio anterior.
- `recurso700.Rmd`: Caso integrador (peso medido según peso reportado, siguiendo los ocho pasos: corrección de un error de digitación, supuestos, errores robustos, prueba de pendiente igual a 1 y predicción).
- `img/`: imágenes.
- `style.css`: estilos del sitio, copiados de la Unidad 2.
- `_site.yml`: menú del sitio.
