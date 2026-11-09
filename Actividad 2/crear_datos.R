# Construye data/datos_actividad2.xlsx, la base de la Actividad 2.
# Los datos son simulados: el caso es ficticio.
# Necesita el paquete writexl.

set.seed(2026)

# ---------------------------------------------------------------
# Hoja 1. pedidos: muestra aleatoria de 10,000 pedidos del tercer trimestre de 2026
# ---------------------------------------------------------------
n <- 10000
fechas <- seq(as.Date("2026-07-01"), as.Date("2026-09-30"), by = "day")
fecha  <- sort(sample(fechas, n, replace = TRUE))

zona     <- sample(c("Norte", "Sur", "Oriente", "Oeste"), n, replace = TRUE, prob = c(0.30, 0.30, 0.20, 0.20))
vehiculo <- sample(c("Moto", "Bicicleta", "Carro"), n, replace = TRUE, prob = c(0.70, 0.20, 0.10))

# Distancia en km: las bicicletas hacen recorridos más cortos
distancia <- ifelse(vehiculo == "Bicicleta", rgamma(n, shape = 3, scale = 0.6), rgamma(n, shape = 3, scale = 1.1))
distancia <- round(pmax(distancia, 0.3), 1)

# Tiempo de entrega en minutos: preparación + recorrido + demoras (asimétrico a la derecha)
minutos_km <- c(Moto = 3.5, Bicicleta = 5.5, Carro = 4.5)[vehiculo]
extra_zona <- c(Norte = 0, Sur = 2, Oriente = 3, Oeste = 1)[zona]
tiempo <- 12 + minutos_km * distancia + extra_zona + rgamma(n, shape = 1.5, scale = 4)
tiempo <- round(tiempo, 1)

metodo_pago <- sample(c("Tarjeta", "Efectivo", "Billetera digital"), n, replace = TRUE, prob = c(0.55, 0.25, 0.20))

# Fraude y alerta del modelo: solo se registran en pagos con tarjeta
tarjeta <- metodo_pago == "Tarjeta"
fraude <- ifelse(tarjeta, rbinom(n, 1, 0.02), NA)
alerta <- ifelse(tarjeta, ifelse(fraude == 1, rbinom(n, 1, 0.92), rbinom(n, 1, 0.05)), NA)

# Prueba A/B de la pantalla de pago: pedidos desde el 19 de agosto (últimas seis semanas)
en_prueba <- fecha >= as.Date("2026-08-19")
version <- ifelse(en_prueba, sample(c("A", "B"), n, replace = TRUE), "Ninguna")

# Cancelación: 8.5 % con la pantalla actual, 6.5 % con la nueva; algo mayor con efectivo
p_cancela <- ifelse(version == "B", 0.065, 0.085)
p_cancela <- p_cancela + ifelse(metodo_pago == "Efectivo", 0.01, -0.003)
cancelado <- rbinom(n, 1, p_cancela)

# Un pedido cancelado no tiene tiempo de entrega
tiempo[cancelado == 1] <- NA

pedidos <- data.frame(
  pedido = sprintf("P%05d", 1:n), fecha, zona, vehiculo, distancia_km = distancia,
  metodo_pago, alerta_fraude = alerta, fraude, version_pago = version, cancelado,
  tiempo_min = tiempo
)

# ---------------------------------------------------------------
# Hoja 2. pedidos_hora: pedidos recibidos por hora, los viernes de 6 a 11 p. m., durante 52 semanas
# ---------------------------------------------------------------
media_zona  <- c(Norte = 20, Sur = 18, Oriente = 11, Oeste = 14)
factor_hora <- c("18" = 0.70, "19" = 1.00, "20" = 0.95, "21" = 0.70, "22" = 0.40)
pedidos_hora <- expand.grid(hora_inicio = as.integer(names(factor_hora)), zona = names(media_zona), viernes = 1:52,
                            stringsAsFactors = FALSE)[, c("viernes", "zona", "hora_inicio")]
lambda <- media_zona[pedidos_hora$zona] * factor_hora[as.character(pedidos_hora$hora_inicio)]
pedidos_hora$pedidos <- rpois(nrow(pedidos_hora), lambda)

# ---------------------------------------------------------------
# Comprobaciones
# ---------------------------------------------------------------
stopifnot(nrow(pedidos) == 10000, nrow(pedidos_hora) == 52 * 4 * 5,
          all(is.na(pedidos$fraude) == !tarjeta), all(is.na(pedidos$tiempo_min) == (pedidos$cancelado == 1)),
          all(pedidos$distancia_km > 0))

writexl::write_xlsx(list(pedidos = pedidos, pedidos_hora = pedidos_hora), "data/datos_actividad2.xlsx")
