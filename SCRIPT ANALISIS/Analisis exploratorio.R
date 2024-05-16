#Detalle de variables
str(data)
names(data)

#columnas se les agrega _ para sus nombres
colnames(data)<-gsub('\\s','_',colnames(data))
data

#se agrega fecha hoy a las filas
fecha_hoy<-Sys.Date()
head(fecha_hoy)
#se une este vector a la data
data<-cbind(data, fecha_hoy)

#se crea un data frame con el listado de las variables de la data
variables<-data.frame(colnames(data)) 
variables
