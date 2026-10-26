#EDA 


# Explorar la estructura de los datos crudos
head(datos_cuenca)
tail(datos_cuenca)
str(datos_cuenca)

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
