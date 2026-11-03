############################################
# 4. MODELOS LINEALES POR GRUPO
############################################

modelos <- datos_agrupados %>%
  
  mutate(
    modelo = map(
      data,
      ~ lm(Q ~ P, data = .x)
    )
  )

print(modelos)

############################################
# 5. EXTRAER RESULTADOS
############################################

modelos <- modelos %>%
  
  mutate(
    coeficientes = map(modelo, tidy),
    ajuste = map(modelo, glance),
    predicciones = map(modelo, augment)
  )

# Coeficientes de cada modelo

modelos %>%
  select(Estacion, Periodo, coeficientes) %>%
  unnest(coeficientes)

############################################
# 6. EXTRAER R2
############################################

resultados <- modelos %>%
  
  select(Estacion, Periodo, ajuste) %>%
  
  unnest(ajuste) %>%
  
  select(
    Estacion,
    Periodo,
    r.squared,
    adj.r.squared,
    p.value
  )

print(resultados)

