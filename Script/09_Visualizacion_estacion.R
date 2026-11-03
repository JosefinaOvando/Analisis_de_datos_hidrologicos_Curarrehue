############################################
# 8. RELACION PRECIPITACION - CAUDAL
# COMPARACION ENTRE ESTACIONES Y TEMPORADAS
############################################

# Ordenar las temporadas
datos_mensuales$Periodo <- factor(
  datos_mensuales$Periodo,
  levels = c("Verano", "Otoño", "Invierno", "Primavera")
)

# Grafico comparativo
ggplot(datos_mensuales,
       aes(x = P, y = Q, color = Estacion)) +
  
  geom_point(
    alpha = 0.5,
    size = 1.9
  ) +
  
  
  facet_wrap(
    ~ Periodo,
    ncol = 2,
    scales = "fixed"
  ) +
  scale_color_manual(
    values = c(
      "Trancura Curarrehue" = "#2166AC",
      "Trancura Llafenco" = "#D95F02",
      "Liucura" = "#1B7837"
    )
  ) +
  
  labs(
    title = "Relación entre precipitación y caudal",
    subtitle = "Comparación estacional entre estaciones de la cuenca alta del Toltén",
    x = "Precipitación mensual (mm)",
    y = "Caudal específico mensual (mm)",
    color = "Estación"
  ) +
  
  theme_minimal(base_size = 12) +
  
  theme(
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold"),
    legend.position = "bottom"
  )
