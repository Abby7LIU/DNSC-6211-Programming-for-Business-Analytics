
# Homework 3

setwd('/Users/liujingyi/Documents/MSBA/6211/Homework/2.0')

data(mtcars)
class(mtcars)

#PartA.a
# name1 contains all the columns(names of the factors), type1 contains the type of all variables
# Combined name1 with type1 to clearly show the type for all columns.
name1 = names(mtcars)
type1<-c('continuous','discrete','continuous','continuousl','continuousl','continuous','continuous','categorical','categorical','discrete','discrete')
df1<-data.frame(name1,type1)
df1

#PartA.b
#I indicated that both 'vs' and 'am' are nominal.
#vs	Engine (0 = V-shaped, 1 = straight), am	Transmission (0 = automatic, 1 = manual)
# Either '0' or '1' in vs or am has an order, they are just stands for something. 

#1PartA.c
## Histgram for mpg
par(mfrow= c(2,3))
hist(mtcars[,1], 
     col='cornflowerblue',
     xlab=name1[1],
     prob=T,
     nclass=20)

## Histgram for disp
hist(mtcars[,3], 
     col='cyan3',
     xlab=name1[3],
     prob=T,
     nclass=20)

## Histgram for hp
hist(mtcars[,4], 
     col='blue',
     xlab=name1[4],
     prob=T,
     nclass=20)

## Histgram for drat
hist(mtcars[,5], 
     col='deepskyblue1',
     xlab=name1[5],
     prob=T,
     nclass=20)

## Histgram for wt
hist(mtcars[,6], 
     col='dodgerblue3',
     xlab=name1[6],
     prob=T,
     nclass=20)

## Histgram for qset
hist(mtcars[,6], 
     col='deepskyblue3',
     xlab=name1[6],
     prob=T,
     nclass=20)

#PartA.d
sprintf('The minimum mpg is %.3f',
        min(mtcars[,1]))
sprintf('The maximum mpg is %.3f',
        max(mtcars[,1]))

#PartA.e
a = quantile(mtcars[,1])
a

#PartA.f
##Interquartile rangeis a measure of statistical dispersion.
##The range of mps is 23.5, Interquartile rangeis = 7.375< 1/2*23.5.
# The dataset mps has a relatively low dispersion to the center. 
sprintf('interquartile range = %.3f',
        a[4]-a[2])




