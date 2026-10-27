# Análisis de Datos Hidrológicos Liucura
**Curso Visualización Datos Medioambientales**
Pontificia Universidad Católica de Chile

Exploración inicial de series hidrológicas y meteorológicas de la cuenca Rio Liucura En Liucura (9416001), a partir de datos de CAMELS-CL.

#Contexto

Comprender el comportamiento hidrológico de una cuenca requiere analizar cómo varían las precipitaciones, los caudales y otras variables meteorológicas a lo largo del tiempo.
Este proyecto se enfoca en la cuenca del río Liucura, en la Región de La Araucanía, utilizando series temporales diarias de la base de datos CAMELS-CL.

El análisis busca responder una pregunta inicial:

**¿Cómo varían las precipitaciones y los caudales del río Liucura a lo largo del tiempo y qué patrones hidrológicos pueden identificarse?**

## Datos

**Fuente:** CAMELS-CL  
**Estación:** Río Liucura en Liucura  
**Código:** 9416001  
**Resolución temporal:** Diaria

Variables consideradas:

- Caudal observado (m³/s y mm/día).
- Precipitación (mm/día).
- Temperatura (°C).
- Evapotranspiración potencial (mm/día).

# Relación con SWAT+

Este análisis constituye una primera aproximación al procesamiento de información hidrometeorológica que posteriormente podría utilizarse en la modelación de la cuenca mediante **SWAT+ (Soil and Water Assessment Tool Plus)**.

Este modelo permite simular procesos hidrológicos y el transporte de sedimentos y nutrientes, integrando información meteorológica, topográfica, de suelos y de usos y coberturas del suelo.

## Estructura del repositorio

- `Datos/`: Datos originales y procesados.
- `Script/`: Códigos de R utilizados en los análisis.
- `Figuras/`: Gráficos y visualizaciones.
- `Outputs/`: Tablas y resultados.
  
## Nota
Proyecto académico en desarrollo. Los análisis actuales son exploratorios y no incluyen todavía simulaciones con SWAT+.
