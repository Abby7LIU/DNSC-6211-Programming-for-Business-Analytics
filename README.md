# Programming-for-Business-Analytics
Homeworks and Projects for DNSC 6211 Programming for Business Analytics

1. [Homework 1](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/Homework1.R)
2. [Homework 2](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/A02a_G44206031.R)
3. Homework 3

## Homework 1

### Part A

 Write your own functions to do the following: 

```R
cToF <- function(tempInC) {
  compute temperature in degree farenheit
  return temperature}
```



```R
fToC <- function(tempInF) {
  compute temperature in degree celcius
  return celcius} 
```


The output should look like the following:
 If cToF is called as
 cToF(28)
 Your calling program should print out the following
 28.00 degrees celcius is 82.40 degrees farenheit 

If fToC is called as
 fToC(78)
 Your calling program should print out the following
 78.00 degrees farenheit is 25.56 degrees celcius 

Note that all responses are rounded to 2 decimal places. 

Name your file as A01a_Gwid.R. So if your GWID is G19860011 then you should name your submission file as A01a_G19860011.R. Please make sure that you comment your R code. 

### Part B 

Consider the following code provided by Dr. Soyer. Please explain what the code in the enclosed box does in the context of the birthday problem. Please make sure that you explain why we need two loops and please explain the role of p[i] and prod. 

Name your response file as A01b_Gwid.docx. So if your GWID is G19860011 then you should name your submission file as A01b_G19860011.docx. Please make sure that you answer both parts of Part B in one file on separate pages. 

```R
## Birthday problem
K=seq(10,70,by=5)
p=rep(0,length(K))

for (i in 1:length(K)) { n=1 

prod=1
while (n<K[i]) { 

    prod=prod*(1-n/365)


n=n+1 } 


  p[i]=1-prod
}
plot(K, p, type="l",
     xlab="number of people",
     ylab="Prob(same birthday)",
     col="blue",lwd=2)
```


## [Homework 2](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/A02a_G44206031.R)

### Part A

The dataset mtcars was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). 

1. Indicate the type of data (categorical or continuous) for each of the variables included in the dataset. 
2. For each of the categorical variables in the survey, indicate whether you believe the variable is nominal or ordinal. 
3. Create a histogram for each of the continuous variables. 
4. Find the maximum and minimum mpg in this sample. 
5. Report the mpg at each of the 25th, 50th, and 75th percentiles. 
6. Report and interpret the interquartile range for the mpg. 

### Part B 

Using the same dataset mtcars that you used in Part A, complete the following using the slides (Basic plots.pdf) 

1. Draw a scatterplot with mpg on the y axis and displacement on the x axis. What does the graph tell you (one or two sentences)? 
2. Draw histograms for mpg by am in the same plot. What does the graph tell you (one or two sentences)? 

### Part C 

All of you must have heard about the central limit theorem (CLT). If not, have a look at this video. 

a. Then run the following R commands. Please spend some time trying understand the code well. 

```R
rnorm2 <- function(n,mean,sd) { mean+sd*scale(rnorm(n)) }
set.seed(1239)
r1 <- rnorm2(100,25,4)
r2 <- rnorm2(50,10,3)
samplingframe <- c(r1,r2)
hist(samplingframe, breaks=20,col = "pink")
```

_Please describe the distribution that you obtain in one or two sentences._

b. Draw 50 samples of size 15 from the sampling frame in part a, and plot the sampling distribution of means as a histogram. 

c. Draw 50 samples of size 45 from the sampling frame in part a, and plot the sampling distribution of means as a histogram. 

d. Explain CLT in your own words in one or two sentences based on your answers to parts b and c. 

Name your file as A02c_Gwid.r. So if your GWID is G19860011 then you should name your submission file as A02c_G19860011.r. Please make sure that you comment your R code. 




