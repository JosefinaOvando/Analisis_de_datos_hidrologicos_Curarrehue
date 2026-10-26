#EDA 

glimpse(datos)
head(datos)

# Dimensiones
dim(datos)

# Nombres de las variables
names(datos)

# Valores faltantes
colSums(is.na(datos))

# Resumen estadístico
summary(datos)
list (datos)

ggplot(datos, aes(x = date, y = Qobs_m3s_day)) +
  geom_line() +
  labs(
    title = "Serie temporal de caudal",
    x = "Fecha",
    y = "Caudal"
  ) +
  theme_minimal()
