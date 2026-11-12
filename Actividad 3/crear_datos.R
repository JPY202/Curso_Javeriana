# Construye data/datos_actividad3.xlsx, la base de la Actividad 3.
# Los datos son simulados: el caso es ficticio.
# Necesita el paquete writexl.

set.seed(2026)

# ---------------------------------------------------------------
# Pedidos entregados en moto en octubre de 2026
# ---------------------------------------------------------------
n <- 1500
fechas <- seq(as.Date("2026-10-01"), as.Date("2026-10-31"), by = "day")
fecha  <- sort(sample(fechas, n, replace = TRUE))

# Distancia real del restaurante al cliente, en km
distancia <- round(pmin(0.3 + rgamma(n, shape = 3, scale = 1.1), 14), 1)

# Tiempo de entrega: la media crece 3.6 minutos por km y la desviación
# estándar también crece con la distancia (varianza no constante)
media_tiempo <- 9 + 3.6 * distancia
de_tiempo    <- 1 + 1.1 * distancia
tiempo <- round(pmax(media_tiempo + rnorm(n, 0, de_tiempo), 5), 1)

# Regla de promesa actual de la aplicación
prometido <- round(20 + 3 * distancia)

# ---------------------------------------------------------------
# Errores de registro del GPS
# ---------------------------------------------------------------
# 6 pedidos con distancia 0: el GPS no registró la ubicación del cliente
cero <- sample(which(distancia >= 2 & distancia <= 6), 6)
# 3 pedidos con el punto decimal corrido: 2.4 km quedó como 24 km
corrido <- sample(setdiff(which(distancia >= 2 & distancia <= 2.8), cero), 3)

distancia_registrada <- distancia
distancia_registrada[cero]    <- 0
distancia_registrada[corrido] <- distancia[corrido] * 10
# La aplicación calculó la promesa con la distancia registrada
prometido[c(cero, corrido)] <- round(20 + 3 * distancia_registrada[c(cero, corrido)])

pedidos <- data.frame(
  pedido = sprintf("P%04d", 1:n),
  fecha,
  distancia_km = distancia_registrada,
  tiempo_prometido_min = prometido,
  tiempo_min = tiempo
)

# ---------------------------------------------------------------
# Comprobaciones
# ---------------------------------------------------------------
stopifnot(nrow(pedidos) == n, sum(pedidos$distancia_km == 0) == 6,
          sum(pedidos$distancia_km > 15) == 3, all(pedidos$tiempo_min >= 5),
          !anyNA(pedidos))

writexl::write_xlsx(list(pedidos = pedidos), "data/datos_actividad3.xlsx")
