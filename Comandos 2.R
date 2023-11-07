#export archivo csv
getwd()
save(data, file="¨¨¨¨/In/01_12_2021/data.Rdata")
#Numero de visitas 
#
library(EDAWR)

library(dplyr)

#seccion para buscar variables.
variables<- data.frame(colnames(data))
# Se crea un codebook con las variables
Codebook<- data.frame(colnames(data), label(data))

# Generar data frame
subdatos<-data.frame(id, Fecha, Estado3, Vis2, Vis3, Vis4, Cargav2, Incidencia)

# Solo ids y vis 1 (filtro) 
agenda<- filter(subdatos, data$vis_tipo == 1 & data$id<=500000 )
head(agenda)
summary(agenda)

# Otro tipo de filtro
Visita2<- subdatos %>%
           filter(data$vis_tipo == 2 & data$id<=500000 ) %>%
           select(id, Fecha, Incidencia)




##Merge visitas y agenda

Resumen1 <- merge(x = agenda, y = Visita2, by = c("id"), all.x = TRUE) # Equivalente
Resumen1 <- rename(Resumen1, Fecha2 = Fecha.y , Incidencia2 = Incidencia.y)
head(Resumen1)
getwd()
summary(Resumen1)

#Tablas De estadO
table(Estado3)
table( Estado5, Estado3, exclude=c("A", "B", "C", NA) )


##Plot
#mutate(Resumen1, date = as.numeric(format(Resumen1$Fecha2,'%m')))


# Date
date <-  as.Date(Resumen1$Fecha2,'%d/%m/%Y')
date
date <-  as.Date('30/10/2018','%d/%m/%Y')
date <- Resumen1$Fecha2
mes <- format(as.Date(date), "%Y-%m")
mes


# Verificar NA
sapply(Resumen1, function(x) sum(is.na(x)))





