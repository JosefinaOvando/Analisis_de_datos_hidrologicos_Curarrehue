###########################################
# 7. ANOMALÍAS ANUALES POR CUENCA
###########################################

anomalias <- datos_mensuales %>%
  
  group_by(Estacion, Anio) %>%
  
  summarise(
    P_anual = if (n() == 12 && !anyNA(P)) sum(P) else NA_real_,
    Q_anual = if (n() == 12 && !anyNA(Q)) sum(Q) else NA_real_,
    .groups = "drop"
  ) %>%
  
  group_by(Estacion) %>%
  
  mutate(
    P_anomalia = P_anual - mean(P_anual, na.rm = TRUE),
    Q_anomalia = Q_anual - mean(Q_anual, na.rm = TRUE)
  ) %>%
  
  ungroup()

print(anomalias)

###########################################
# 8. GRÁFICO DE ANOMALÍAS
###########################################

ggplot(anomalias, aes(x = Anio, y = P_anomalia)) +
  
  geom_col(aes(fill = P_anomalia < 0)) +
  
  geom_hline(
    yintercept = 0,
    color = "black"
  ) +
  
  facet_wrap(
    ~ Estacion,
    ncol = 1
  ) +
  
  scale_fill_manual(
    values = c("FALSE" = "#619BBF",
               "TRUE" = "#CF7970"),
    guide = "none"
  ) +
  
  labs(
    title = "Anomalías anuales de precipitación",
    subtitle = "Período 1980–2020",
    x = "Año",
    y = "Anomalía de precipitación (mm)"
  ) +
  
  theme_minimal()

###########################################
# 9. ANOMALÍAS MENSUALES ESTANDARIZADAS
###########################################

sequia <- datos_mensuales %>%
  
  group_by(Estacion, Mes) %>%
  
  mutate(
    P_z = (P - mean(P, na.rm = TRUE)) /
      sd(P, na.rm = TRUE),
    
    Q_z = (Q - mean(Q, na.rm = TRUE)) /
      sd(Q, na.rm = TRUE)
  ) %>%
  
  ungroup() %>%
  
  mutate(
    Fecha = make_date(Anio, Mes, 1)
  )

print(sequia)

###########################################
# 10. PERÍODOS SECOS POR CUENCA
###########################################

ggplot(sequia, aes(x = Fecha, y = P_z)) +
  
  geom_line(
    color = "#619BBF",
    linewidth = 0.4
  ) +
  
  geom_hline(
    yintercept = -1,
    color = "#CF7970",
    linetype = "dashed"
  ) +
  
  geom_hline(
    yintercept = 0,
    color = "gray50"
  ) +
  
  facet_wrap(
    ~ Estacion,
    ncol = 1
  ) +
  
  labs(
    title = "Anomalías mensuales de precipitación",
    subtitle = "La línea roja indica valores inferiores a -1 desviación estándar",
    x = "Año",
    y = "Anomalía estandarizada"
  ) +
  
  theme_minimal()

###########################################
# 11. RESUMEN DE PERÍODOS SECOS
###########################################

resumen_sequia <- sequia %>%
  
  group_by(Estacion) %>%
  
  summarise(
    Meses_secos = sum(P_z < -1, na.rm = TRUE),
    
    Meses_caudal_bajo = sum(Q_z < -1, na.rm = TRUE),
    
    Meses_coincidentes = sum(
      P_z < -1 & Q_z < -1,
      na.rm = TRUE
    )
  )

print(resumen_sequia)

