# Extraer caudal y precipitación manteniendo el índice temporal (fecha)
# Se extraen como data.frames independientes

df_Q <- data.frame(date = time(datos_cuenca) , Q = datos_cuenca$Qobs_m3s_day)
df_P <- data.frame(date = time(datos_cuenca) , P = datos_cuenca$P_mm_day)

# 5. Exportar los datos al disco local
write.csv(df_Q, file.path(data_out, "caudal_cuenca_liucura.csv"), row.names = TRUE)
write.csv(df_P, file.path(data_out, "precipitacion_cuenca_liucura.csv"), row.names = TRUE)


# Importar los archivos previamente generados
# read_csv asigna clases a las columnas de forma automática
caudal_importado <- read_csv(file.path(data_out,"caudal_cuenca_liucura.csv"))
precip_importada <- read_csv(file.path(data_out,"precipitacion_cuenca_liucura.csv"))

# Asegurar que la columna 'date' tenga la estructura temporal correcta
caudal_importado$date <- ymd(caudal_importado$date); caudal_importado
precip_importada$date <- ymd(precip_importada$date)

#Unir ambas series en un solo objeto relacional usando la fecha como llave
balance_catchment <- precip_importada %>%
  inner_join(caudal_importado, by = "date")
