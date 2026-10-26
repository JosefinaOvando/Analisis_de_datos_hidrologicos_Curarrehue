#Guardar en carpeta
data_out <- "C:\\Users\\josef\\git-practica\\Analisis_de_datos_hidrologicos_Curarrehue\\Datos"


#Identificador de Subcuenca Rio Liucura En Liucura (CAMELS_CL)

codigo_cuenca <- 9416001

#Extracción serie de tiempo completa en resolución diaria

datos_cuenca <- getData(
  x = codigo_cuenca,
  tscale = "daily"  
)
