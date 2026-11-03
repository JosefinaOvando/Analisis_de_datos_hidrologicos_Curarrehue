############################################
# 2. AGRUPACION TEMPORAL
############################################

datos_mensuales <- datos %>%
  mutate(
    Anio = year(Fecha),
    Mes = month(Fecha),
    
    Periodo = case_when(
      Mes %in% c(12, 1, 2) ~ "Verano",
      Mes %in% c(3, 4, 5)  ~ "Otoño",
      Mes %in% c(6, 7, 8)  ~ "Invierno",
      Mes %in% c(9, 10, 11) ~ "Primavera"
    )
  ) %>%
  
  group_by(Estacion, Anio, Mes, Periodo) %>%
  
  summarise(
    # Solo conservar meses con datos completos
    P = if (sum(!is.na(P)) == days_in_month(first(Fecha)))
      sum(P) else NA_real_,
    
    Q = if (sum(!is.na(Q)) == days_in_month(first(Fecha)))
      sum(Q) else NA_real_,
    
    .groups = "drop"
  ) %>%
  
  filter(!is.na(P), !is.na(Q))

head(datos_mensuales)

