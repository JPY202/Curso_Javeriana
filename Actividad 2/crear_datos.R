# Construye data/datos_actividad2.xlsx, la base de la Actividad 2.
# Los datos son simulados: el caso es ficticio.
# Necesita el paquete writexl.

set.seed(2026)

# Hoja 1. Pedidos recibidos entre las 7 y las 8 p. m. en 40 viernes (problema 2)
# Se simulan con una Poisson de media 18 pedidos por hora.
pedidos_viernes <- data.frame(
  viernes = 1:40,
  pedidos = rpois(40, lambda = 18)
)

# Hoja 2. Tiempo de entrega de 60 pedidos elegidos al azar (problema 3)
# Gamma con forma 6 y media 32 minutos: asimétrica a la derecha, como los tiempos reales.
tiempos_entrega <- data.frame(
  pedido = sprintf("P%03d", 1:60),
  tiempo = round(rgamma(60, shape = 6, scale = 32 / 6), 1)
)

# Hoja 3. Prueba A/B de la pantalla de pago (problema 4)
# 1,500 pedidos por versión, asignados al azar. Cancelaciones fijas: 128 en A y 98 en B.
cancela_A <- sample(rep(c(1, 0), c(128, 1500 - 128)))
cancela_B <- sample(rep(c(1, 0), c(98, 1500 - 98)))
prueba_ab <- data.frame(
  pedido = sprintf("AB%04d", 1:3000),
  version = rep(c("A", "B"), each = 1500),
  cancelado = c(cancela_A, cancela_B)
)
prueba_ab <- prueba_ab[sample(nrow(prueba_ab)), ]   # el orden de las filas no revela la versión
prueba_ab$pedido <- sprintf("AB%04d", 1:3000)

# Comprobaciones
stopifnot(nrow(pedidos_viernes) == 40, nrow(tiempos_entrega) == 60, nrow(prueba_ab) == 3000,
          sum(prueba_ab$cancelado[prueba_ab$version == "A"]) == 128,
          sum(prueba_ab$cancelado[prueba_ab$version == "B"]) == 98,
          all(tiempos_entrega$tiempo > 0))

writexl::write_xlsx(list(pedidos_viernes = pedidos_viernes,
                         tiempos_entrega = tiempos_entrega,
                         prueba_ab = prueba_ab),
                    "data/datos_actividad2.xlsx")
