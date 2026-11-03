#Guardar en carpeta
data_out <- "C:\\Users\\josef\\git-practica\\Analisis_de_datos_hidrologicos_Curarrehue\\Datos"

############################################
# 1. ESTACIONES HIDROLOGICAS
############################################

estaciones <- tibble(
  codigo = c(9412001, 9414001, 9416001),
  Estacion = c(
    "Trancura Curarrehue",
    "Trancura Llafenco",
    "Liucura"
  )
)

# Descargar y unir series diarias
datos <- map2_dfr(
  estaciones$codigo,
  estaciones$Estacion,
  function(codigo, nombre) {
    
    x <- getData(codigo, na.rm = FALSE)
    
    tibble(
      Fecha = as.Date(zoo::index(x)),
      P = as.numeric(x[, "P_mm_day"]),
      Q = as.numeric(x[, "Qobs_mm_day"]),
      Estacion = nombre
    )
  }
)

head(datos)

