Q.zoo   <- datos_cuenca$Qobs_mm_day
T.zoo   <- datos_cuenca$Tavg_degC_day
ETP.zoo <- datos_cuenca$PET_mm_day
P.zoo   <- datos_cuenca$P_mm_day

par(mfrow=c(4,1))
plot(P.zoo   , xlab="Time", col="lightblue", main="Precipitación"        , ylab="P [mm/día]")
grid()
plot(T.zoo, xlab="Time", col="red"      , main="Temperatura media del aire"      , ylab="Temp [degC]" )
grid()
plot(ETP.zoo , xlab="Time", col="darkgreen", main="Evapotranspiración potencial", ylab="ETP [mm/día]")
grid()
plot(Q.zoo, xlab="Time" , col="blue"    , main="Caudal" , ylab="Q, [mm]" )
grid()

