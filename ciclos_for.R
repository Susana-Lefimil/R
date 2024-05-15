### Ciclos for para visualizacion de datos en un DataFrame

#Ver columnas de una data
for (col in names(data)){       
    print(col)   #
  #print(sum(is.na(data[[col]])))
} 

#Print columnas y sus valores
for(i in 1:ncol(data)){
    print(data[i])
    #print(data[[i]])
}

#Print una columna específica, para ver sus filas
for (i in 1:nrow(data)){   
    print(data$columna[[i]])
  #print(i)
} 

#Funcion para ver número de NAs por columna

nas<- function(data){
for (col in names(data)){         
    print(col)   # data está indexada por el valor actual de "col"
    print(sum(is.na(data[[col]])))
 }
}
nas(data2)
