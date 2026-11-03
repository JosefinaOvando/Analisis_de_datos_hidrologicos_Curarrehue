# Coeficientes de los 12 modelos
tabla_coeficientes <- modelos %>%
  select(Estacion, Periodo, coeficientes) %>%
  unnest(coeficientes)

# Guardar coeficientes
write_csv(
  tabla_coeficientes,
  "Output/coeficientes_modelos.csv"
)

# Guardar R2 y estadisticas de ajuste
write_csv(
  resultados,
  "Output/resultados_modelos.csv"
)

# Guardar predicciones y residuos
tabla_predicciones <- modelos %>%
  select(Estacion, Periodo, predicciones) %>%
  unnest(predicciones)

write_csv(
  tabla_predicciones,
  "Output/predicciones_modelos.csv"
)
