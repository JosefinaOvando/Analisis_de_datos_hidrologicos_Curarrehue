# Análisis de Datos Hidrológicos de las Subcuencas del Río Trancura y Liucura
**Curso Visualización Datos Medioambientales**
Pontificia Universidad Católica de Chile

Exploración inicial de series hidrológicas y meteorológicas de la sincuenca Rio Liucura En Liucura.

# Contexto

Comprender el funcionamiento hidrológico de una cuenca requiere analizar la variabilidad temporal de las precipitaciones, los caudales y otras variables meteorológicas.

Este proyecto desarrolla un análisis exploratorio y comparativo de tres estaciones fluviométricas de la cuenca alta del río Toltén, en la Región de La Araucanía, Chile.

El período de estudio comprende los años **1980–2020**, sujeto a la disponibilidad de registros en cada estación.

El análisis busca identificar patrones temporales y estacionales en el comportamiento hidrológico de las cuencas, así como explorar las relaciones entre precipitación y caudal.

## Preguntas de análisis

1. ¿Cómo varían las precipitaciones y los caudales entre las estaciones
del río Trancura y Liucura?
  
  2. ¿Qué patrones temporales y estacionales pueden identificarse en
las series hidrometeorológicas?
  
  3. ¿Cómo varía la relación entre precipitación y caudal según la
estación fluviométrica y la temporada del año?

## Datos
**Fuente:** CAMELS-CL (Alvarez-Garreton et al., 2018).

### Estaciones Fluviométricas
  | Código | Estación |
  |--------|----------|
  | 9412001 | Río Trancura en Curarrehue |
  | 9414001 | Río Trancura antes del río Llafenco |
  | 9416001 | Río Liucura en Liucura |

Variables consideradas:

- Caudal observado (m³/s y mm/día).
- Precipitación (mm/día).
- Temperatura (°C).
- Evapotranspiración potencial (mm/día).

**Resolución temporal original:** Diaria.
Para determinados análisis, las series se agregan a escala mensual, permitiendo comparar la variabilidad de las precipitaciones y los caudales entre estaciones y temporadas.

## Análisis estacional
Las observaciones se agrupan según las cuatro estaciones del año:
  
  - **Verano:** diciembre, enero y febrero.
- **Otoño:** marzo, abril y mayo.
- **Invierno:** junio, julio y agosto.
- **Primavera:** septiembre, octubre y noviembre.

Esta clasificación permite explorar posibles diferencias estacionales en la relación entre precipitación y caudal.

### Modelos lineales por estación y temporada

Se ajustan modelos de regresión lineal para explorar la asociación entre la precipitación y el caudal mensual:
  
  Q = β₀ + β₁P + ε

Donde:

- **Q:** caudal específico mensual (mm).
- **P:** precipitación mensual (mm).
- **β₀:** intercepto del modelo.
- **β₁:** coeficiente asociado a la precipitación.
- **ε:** término de error.

Para automatizar los análisis se utilizan las funciones:
  
- `group_by()`: agrupar observaciones por estación y temporada.
- `nest()`: organizar los datos de cada grupo.
- `map()`: ajustar modelos lineales independientes.
- `tidy()`: extraer los coeficientes de los modelos.
- `glance()`: obtener indicadores de ajuste, como R².
- `augment()`: obtener valores estimados y residuos.

### Visualización y comparación de resultados

Los resultados se representan mediante:
  
- Gráficos de series temporales.
- Gráficos de dispersión entre precipitación y caudal.
- Gráficos de barras de los coeficientes de determinación (R²).

El objetivo es identificar diferencias en la asociación entre precipitación y caudal según la estación fluviométrica y la temporada.

Los modelos lineales se utilizan con fines exploratorios y no representan por sí solos la complejidad de los procesos hidrológicos.

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

## Referencias

Alvarez-Garreton, C., et al. (2018). The CAMELS-CL dataset: Catchment attributes and meteorology for large sample studies –
Chile dataset. *Hydrology and Earth System Sciences, 22*, 5817–5846. https://doi.org/10.5194/hess-22-5817-2018

**Base de datos:** https://camels.cr2.cl/
