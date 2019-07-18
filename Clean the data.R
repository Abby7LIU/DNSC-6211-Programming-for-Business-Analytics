library(zipcode)

mydf <- read.csv("NY Restaurants.csv", header = TRUE)

data(zipcode)
zipcode
names(zipcode)[names(zipcode)=="zip"]="ZIPCODE"

mydf[mydf==""]  <- NA 


mydf$GRADE.DATE <- as.Date(mydf$GRADE.DATE,"%m/%d/%Y")

mydf1 <- subset(mydf, GRADE.DATE > '2018-1-1')
mydf2 <- subset(mydf1, BORO == 'BROOKLYN' | BORO == 'MANHATTAN')


df_revised <- merge(mydf2, zipcode, by='ZIPCODE', all.x=TRUE)

sum(is.na(df_revised))

df_revised <- na.omit(df_revised)

sapply(df_revised, function(x) sum(is.na(x)) )

df_revised <- subset(df_revised, select = -c(BUILDING, STREET, state ,city, DBA, CAMIS,PHONE,INSPECTION.DATE,GRADE.DATE, 
                                             RECORD.DATE,VIOLATION.CODE,ACTION) )

# Select 10 popular kinds of restaurants
selected <- subset(df_revised, CUISINE.DESCRIPTION == 'Chinese'|CUISINE.DESCRIPTION == 'Korean'|CUISINE.DESCRIPTION == 'American'
            |CUISINE.DESCRIPTION == 'Seafood'|CUISINE.DESCRIPTION == 'Japanese'|CUISINE.DESCRIPTION == 'Pizza'
            |CUISINE.DESCRIPTION == 'Steak'|CUISINE.DESCRIPTION == 'French'|CUISINE.DESCRIPTION == 'Italian'
            |CUISINE.DESCRIPTION == 'Bakery')


# write the file 
write.csv(selected,file = "revised.csv",row.names = TRUE)












