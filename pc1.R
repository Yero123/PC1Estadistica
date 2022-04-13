#Lectura de datos
datos = read.csv(file.choose(),stringsAsFactors = TRUE)


d$NObeyesdad = factor(d$NObeyesdad,levels=levels(d$NObeyesdad)[c(1,2,6,7,3,4,5)])
d$FCVC = factor(d$FCVC,levels = levels(d$FCVC)[c(2,3,1)])
d$CH2O = factor(d$CH2O,levels=levels(d$CH2O)[c(2,1,3)])
d$CALC = factor(d$CALC,levels = levels(d$CALC)[c(3,4,2,1)])
d$CAEC = factor(d$CAEC,levels = levels(d$CAEC)[c(3,4,2,1)])
d$TUE = factor(d$TUE,levels = levels(d$TUE)[c(2,3,1)])

#Lectura de las librerías a emplear
library(DescTools)
library(EnvStats)

#Defino NCP y GENDER según los datos de la tabla
NCP = datos$NCP
Gender = datos$Gender

#COMPARANDO DATOS SEGÚN EL GÉNERO:
#Pacientes mujeres
#Se obtiene la frecuencia de pacientes en ICU cuyo género es mujer
Table_ICU_women = Freq(as.factor(ICU[GENDER == 1]))
nwomen = length(as.factor(ICU[GENDER == 1]))
#Calculo la frecuencia relativa de los paciencientes en ICU cuyo
#género es mujer
fw = Table_ICU_women$freq/nwomen
#Gráfico de barras de la frecuencia relativa de pacientes en ICU cuyo
#género es mujer
barplot(fw, names = c("No ingresó a ICU", "Ingresó a ICU"),
        xlab = "Pacientes en ICU",
        ylab = "Frecuencia relativa",
        main = "Distribución de frecuencias de la cantidad de pacientes
de sexo femenino en Unidad de Cuidados Intensivos")
#Pacientes Varones
#Se obtiene la frecuencia de pacientes en ICU cuyo género es varón
Table_ICU_men = Freq(as.factor(ICU[GENDER == 0]))
nmen = length(as.factor(ICU[GENDER == 0]))
#Calculo la frecuencia relativa de los paciencientes en ICU cuyo
#género es varón
fm = Table_ICU_men$freq/nmen
#Gráfico de barras de la frecuencia relativa de pacientes en ICU cuyo
#género es varón
barplot(fm, names = c("No ingresó a ICU", "Ingresó a ICU"),
        xlab = "Pacientes en ICU",
        ylab = "Frecuencia relativa",
        main = "Distribución de frecuencias de la cantidad de pacientes
de sexo masculino en Unidad de Cuidados Intensivos")