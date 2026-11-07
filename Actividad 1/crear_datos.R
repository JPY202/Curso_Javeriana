# Construye la base de la Actividad 1 a partir de la base original.
# Entrada: fuente/data_actividad1_original.xlsx (2,220 filas, 37 variables).
# Salida:  data/datos_actividad1.xlsx (2,220 filas, 38 variables).
#
# Cambios:
# 1. Se agrega id_cliente. De las 179 filas repetidas, 90 se marcan como el mismo
#    cliente registrado dos veces (mismo id_cliente). Las otras 89 reciben un
#    id_cliente propio: son clientes distintos con el mismo perfil.
# 2. Donde falta MntWines, también quedan faltantes MntTotal y MntRegularProds,
#    porque el total no se puede calcular sin el gasto en vino. Así el gasto en
#    vino no se puede recuperar restando.
# 3. El ingreso pasa a pesos colombianos por mes (se multiplica por 10).
# 4. Los gastos de los últimos 2 años pasan a pesos colombianos (se multiplican por 10,000).
# 5. Las variables se renombran en español y se ordenan por tema. El nivel
#    "2n Cycle" de la fuente se define para este caso como educación media
#    (bachillerato), según la tabla de variables de la versión anterior de la
#    actividad, que lo describía como secondary education.
#
# Se conservan, a propósito, las inconsistencias de la base original:
# edad de 240 años, marital_Divorced igual a 100 y gasto regular negativo.

library(readxl)
library(writexl)

original <- as.data.frame(read_excel("fuente/data_actividad1_original.xlsx"))
datos <- original

# 1. Identificador --------------------------------------------------------------

clave <- apply(datos, 1, paste, collapse = "|")
repetida <- duplicated(clave)                     # 179 filas iguales a una anterior

set.seed(2026)
filas_repetidas <- which(repetida)
mismo_cliente <- sort(sample(filas_repetidas, 90)) # mismo cliente registrado dos veces

id <- character(nrow(datos))
siguiente <- 1
for (i in seq_len(nrow(datos))) {
  if (i %in% mismo_cliente) {
    primera <- match(clave[i], clave)              # primera aparición de esa fila
    id[i] <- id[primera]
  } else {
    id[i] <- sprintf("C%04d", siguiente)
    siguiente <- siguiente + 1
  }
}

# 2. El gasto en vino no se puede recuperar ---------------------------------------

sin_vino <- is.na(datos$MntWines)
datos$MntTotal[sin_vino] <- NA
datos$MntRegularProds[sin_vino] <- NA

# 3 y 4. Pesos colombianos ----------------------------------------------------------

datos$Income <- datos$Income * 10

gastos <- c("MntWines", "MntFruits", "MntMeatProducts", "MntFishProducts",
            "MntSweetProducts", "MntGoldProds", "MntTotal", "MntRegularProds")
datos[gastos] <- lapply(datos[gastos], function(x) x * 10000)

# 5. Nombres en español -------------------------------------------------------------

nombres <- c(
  id_cliente               = NA,
  edad                     = "Age",
  ingreso                  = "Income",
  ninos_hogar              = "Kidhome",
  adolescentes_hogar       = "Teenhome",
  dias_cliente             = "Customer_Days",
  dias_ultima_compra       = "Recency",
  ec_casado                = "marital_Married",
  ec_union_libre           = "marital_Together",
  ec_soltero               = "marital_Single",
  ec_divorciado            = "marital_Divorced",
  ec_viudo                 = "marital_Widow",
  educ_basica              = "education_Basic",
  educ_media               = "education_2n Cycle",
  educ_pregrado            = "education_Graduation",
  educ_maestria            = "education_Master",
  educ_doctorado           = "education_PhD",
  gasto_vino               = "MntWines",
  gasto_frutas             = "MntFruits",
  gasto_carne              = "MntMeatProducts",
  gasto_pescado            = "MntFishProducts",
  gasto_dulces             = "MntSweetProducts",
  gasto_oro                = "MntGoldProds",
  gasto_total              = "MntTotal",
  gasto_regular            = "MntRegularProds",
  compras_descuento        = "NumDealsPurchases",
  compras_web              = "NumWebPurchases",
  compras_catalogo         = "NumCatalogPurchases",
  compras_tienda           = "NumStorePurchases",
  visitas_web_mes          = "NumWebVisitsMonth",
  acepto_campana1          = "AcceptedCmp1",
  acepto_campana2          = "AcceptedCmp2",
  acepto_campana3          = "AcceptedCmp3",
  acepto_campana4          = "AcceptedCmp4",
  acepto_campana5          = "AcceptedCmp5",
  total_campanas_aceptadas = "AcceptedCmpOverall",
  queja                    = "Complain",
  acepto_piloto            = "Response"
)

stopifnot(setequal(nombres[-1], names(original)))

nueva <- data.frame(id_cliente = id, datos[, nombres[-1]], check.names = FALSE)
names(nueva) <- names(nombres)

dir.create("data", showWarnings = FALSE)
write_xlsx(nueva, "data/datos_actividad1.xlsx")

# Comprobaciones ------------------------------------------------------------------

stopifnot(
  nrow(nueva) == 2220,
  ncol(nueva) == 38,
  sum(duplicated(nueva$id_cliente)) == 90,           # mismo cliente dos veces
  sum(duplicated(nueva)) == 90,                      # filas idénticas con el id
  sum(duplicated(nueva[, -1])) == 179,               # filas iguales sin el id
  all(is.na(nueva$gasto_total[is.na(nueva$gasto_vino)]))
)
