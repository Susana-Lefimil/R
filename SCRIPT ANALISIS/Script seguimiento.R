
#install.packages("dplyr")
library(dplyr)
#data %>% select(var1, var3)

#Detalle de variables
str(data)
names(data)

#columnas se les agrega _ para sus nombres
colnames(data)<-gsub('\\s','_',colnames(data))
data
#se agrega fecha hoy a las filas
fecha_hoy<-Sys.Date()
head(fecha_hoy)

#se crea un data frame con el listado de las variables de la data
variables<-data.frame(colnames(data)) 
variables

# Se trabaja con una tabla con las variables de interes y se filtra por estado

table<- data %>% select(folio, estado_2, estado_3, agend_s1, agend_s2, agend_s3, agend_s4, agend_s5, agend_s6, agend_s7, agend_s8, fecha_hoy)

table<-filter(table, estado_3 ==1 | estado_2 ==3  )

my_data <- mutate_at(table, c( "agend_s1", "agend_s2", "agend_s3", "agend_s4", "agend_s5", "agend_s6", "agend_s7", "agend_s8"), ~replace(., is.na(.), 0))


# Se debe seleccionar la ultima fecha de seguimiento de cada folio
table$cond<-ifelse(table$agend_s8!="NA", table$agend_s8,
            ifelse(table$agend_s7!="NA" & table$agend_s8=="NA", table$agend_s7))

table
table[table == ""] <- NA 
table <- mutate_at(table, c( "agend_s1", "agend_s2", "agend_s3", "agend_s4", "agend_s5", "agend_s6", "agend_s7", "agend_s8"), ~replace(., is.na(.), 0))
table$cond<-ifelse(table$agend_s1!=0 & table$agend_s2==0, table$agend_s1,
                ifelse(table$agend_s2!=0 & table$agend_s3==0, table$agend_s2,
                  ifelse(table$agend_s3!=0 & table$agend_s4==0, table$agend_s3,
                    ifelse(table$agend_s4!=0 & table$agend_s5==0, table$agend_s4,
                      ifelse(table$agend_s5!=0 & table$agend_s6==0, table$agend_s5,
                        ifelse(table$agend_s6!=0 & table$agend_s7==0, table$agend_s6,
                          ifelse(table$agend_s7!=0 & table$agend_s8==0, table$agend_s7,  
                            ifelse(table$agend_s8!=0, table$agend_s8, 0))))))))


#Ahora generar resta de fecha_hoy y cond

table$rest<- (table$fecha_hoy - table$cond)
installed.packages("lubridate")
library(lubridate)
#table$rest <- rep(table$fecha_hoy,  table$cond)
table$rest <-as.Date(table$fecha_hoy) - as.Date(table$cond)

write.csv(table, "mi_df.csv")
save(table)

##