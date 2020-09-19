

getwd()

setwd("C:/Users/Susana/Desktop/R_clases")
## Vectores
x <- vector("numeric", length = 10)
x
###Matrices
m<-1:10
m
dim(m)<-c(2,5)

##Matrices 2

x<- 5:8
y<-12:15
cbind(x,y)

rbind(x,y)

## Operaciones vectoriales

2+3*4/5

?base:Sintax  ## sintaxis operaciones

x<- 7:10
y<-9:12
x+y

x>8

y==11

x*y

x/y
 ## Recorriendo con un for
for (i in 1:length(x)){
      print(x[i]+y[i])
}


## Operacion vectoriales con matrices

x<- matrix(1:16,4,4)
y<- matrix(rep(5,16),4,4)

## SUma
x+y
## Multiplicacion
x*y

## Div  
x%%y


### Datos de fechas y tiempo

# tipo POSIXct: parte del primero de enero 1970
# posterior a esta fecha será positivo, anterior será negativo


#tipo POSIXlt: Orden de un vector de este tipo es: Seg< Min< Hora< Dia del mes< mes del año< años desde 1990 <
#Dia de la semana< Dia del año < Indicador de horario de verano


t<- Sys.time()  ## funcion sirve para saber fecha actual
typeof(t) 

t

cat (t,"\n")

# as.POSIXct y as.POSIXlt  se puede....

l <- as.POSIXlt(t)
l
typeof(l) ## ahora imprime list

cat(l,"\n")  ## Error
names(l)
l[1]
l[2]
l[10]


## Pasar fecha a character
t<- Sys.time()
cat(t,"\n")
t
tiempo<-strftime(t,"%Y-%m-%d %H:%M:%S")
typeof(tiempo)

tiempo 

###Pasar fecha POSiX (tipo tiempo)

mi_fecha<-c("2014-01-23 14:28:21")
typeof(mi_fecha)
mi_fecha

my_date<-strptime(mi_fecha, "%Y-%m-%d %H:%M:%S")
my_date

typeof(my_date)

class(my_date)

# Diferencias entre tiempos

mi_fecha1<-c("2014-01-23 14:28:21")
my_date<-strptime(mi_fecha, "%Y-%m-%d %H:%M:%S")
my_date2<- Sys.time()
my_date2
my_date2- my_date


## Date
fecha <- c("1 jan 2012", "1 jan 2013", "1 jan 2014")
fecha_Date <-as.Date(fecha, "%d %b %Y")
class(fecha_Date)

fecha[1]
fecha[2]
fecha[3]

##Dif date

cumple <- as.Date(0, origin="1977-12-25")
hoy <-Sys.Date()
hoy - cumple


#format  (regresa el formato en tipo caracter)

now <- Sys.time()
now

format(now, "%H:%M")


#Comparaciones

diff<- as.difftime("00:30:00", "%H:%M:%S",
units="hour")

ahora<- Sys.time()
alrato<-now+ diff
ahora

alrato

ahora<alrato

alrato<ahora




