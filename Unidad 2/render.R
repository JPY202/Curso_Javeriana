# Genera todos los HTML de la unidad en la carpeta docs/unidad2 del repositorio.
# También se puede usar el botón Build > Render Website de RStudio.

if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  install.packages("rmarkdown")
}

dir.create("../docs/unidad2", recursive = TRUE, showWarnings = FALSE)

rmarkdown::render_site(encoding = "UTF-8")
