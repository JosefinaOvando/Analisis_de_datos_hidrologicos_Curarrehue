# Crear la columna año
balance_catchment <- balance_catchment %>%
  mutate(year = lubridate::year(date))

# Calcular estadísticas anuales
resumen_anual <- balance_catchment %>%
  group_by(year) %>%
  summarise(
    P_total_mm = sum(P, na.rm = TRUE),
    Q_medio_m3s = mean(Q, na.rm = TRUE),
    dias_registro = n(),
    .groups = "drop"
  ) %>%
  filter(dias_registro >= 365)

# Ver resultados
head(resumen_anual)



