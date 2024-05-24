mtcars

##Librería dplyr

library(dplyr)

## Para filtrar

df<-filter(mtcars, hp<70)
df


## Para cambiar vacíos a NA
df[df == ""] <- NA


## Para seleccionar algunas columnas

df_1 <- mtcars %>%
  select(cyl:drat)
df_1


## Para cambiar el valor de una variable con ifelse

df$mpg<-ifelse(df$wt<2 | is.na(df$wt), 999, df$mpg )
df


## Para cambiar el valor de varias columnas con ifelse


df_2<- mutate_at(df, c("hp", "drat", "wt"), ~ifelse(carb!=2, 999, 880))
df_2


## Para cambiar el valor de varias variables con replace

df_3<- mutate_at(df, c("hp", "drat", "wt"), ~replace(., carb!=2, 999))
df_3

## Para crear una variable con la suma de dos columnas específicas

mt<-mtcars %>% mutate(var = rowSums(select(., contains("d"))))
mt
