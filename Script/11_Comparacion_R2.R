############################################
# 7. GRAFICO COMPARATIVO DE R2
############################################

ggplot(resultados,
       aes(x = Estacion, y = r.squared, fill = Periodo)) +
  
  geom_col(position = "dodge") +
  
  labs(
    title = "Relación entre precipitación y caudal",
    subtitle = "Comparación estacional entre estaciones hidrológicas",
    x = "Estación hidrológica",
    y = expression(R^2),
    fill = "Temporada"
  ) +
  
  theme_minimal()

############################################
# 8. RELACION PRECIPITACION - CAUDAL
# COMPARACION ESTACIONAL POR ESTACION
############################################

# Ordenar las temporadas
datos_mensuales$Periodo <- factor(
  datos_mensuales$Periodo,
  levels = c("Verano", "Otoño", "Invierno", "Primavera")
)

# Crear un grafico independiente por estacion
for (est in unique(datos_mensuales$Estacion)) {
  
  grafico <- datos_mensuales %>%
    filter(Estacion == est) %>%
    
    ggplot(aes(x = P, y = Q)) +
    
    geom_point(
      color = "#4F8296",
      alpha = 0.4,
      size = 1.5
    ) +
    
    geom_smooth(
      method = "lm",
      se = FALSE,
      color = "#C87963",
      linewidth = 0.8
    ) +
    
    facet_wrap(~ Periodo, ncol = 2) +
    
    labs(
      title = est,
      subtitle = "Relación estacional entre precipitación y caudal",
      x = "Precipitación mensual (mm)",
      y = "Caudal específico mensual (mm)"
    ) +
    
    theme_minimal(base_size = 12) +
    
    theme(
      panel.grid.minor = element_blank(),
      strip.text = element_text(face = "bold"),
      plot.title = element_text(face = "bold")
    )
  
  print(grafico)
}