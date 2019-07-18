# Programming-for-Business-Analytics
Homeworks and Projects for DNSC 6211 Programming for Business Analytics

1. [Assignment 1: Basic practices](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/Homework1.R)
2. [Assignment 2: Functions](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/A02a_G44206031.R)
3. [Assignmnet 3: Logistic Regression](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/Assignment%203:%20Melvin’s%20Performance%20Anaylsis.pdf)
4. [Assignment 4: Evaluating Sales Performance](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/A04_G44206031.Rmd)

## Assignment 1: Basic practices

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


## [Assignment 2: Functions](https://github.com/Abby7LIU/Programming-for-Business-Analytics/blob/master/A02a_G44206031.R)

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

## Assignmnet 3 Logistic Regression

 Use the file **kicksfootball.csv** for this assignment. 

Coach Trayvon kept a record of all field goals that Melvin attempted in practice sessions and practice matches. 

### Part A

How would you describe Melvin’s overall record? Describe your prediction regarding Melvin’s attempts at field goals? (Hint: make this easy on yourselves by sticking to computing simple probabilities; I don’t want anything more sophisticated than that) 

### Part B

Do Melvin’s attempts in matches differ from his performance in practice? Use the handout I have provided for logistic regression for this question. 

a) Write out the logistic function for i. Practice, and 

ii. Matches 

1. b)  What is the probability of Melvin scoring a goal when he kicks from 20, 40 and 60 yards in 

   practice? 

2. c)  What is the probability of Melvin scoring a goal when he kicks from 20, 40 and 60 yards in 

   matches? 

### Part C

Using ggplot, plot the logistic models for his performance in matches as well as in practice **in a single** 

**plot**. Make sure that the plot has a title, labels for X and Y axes, and a legend. 

## Assignment 4: Evaluating Sales Performance

The marketing managers of an office products company have some difficulty in evaluating the field sales representatives' performance. The representatives travel among the outlets for the company's products, create displays, try to increase volume, introduce new products, and discover any problems that the outlets are having with the company's products. The job involves a great deal of travel time. The marketing managers believe that one important factor in the representatives' performance is the motivation to spend a great deal of time on the road. Other variables also have an effect. Some sales districts have more potential than others, either because of differences in population or differences in the number of retail outlets. Large districts are difficult because of the extra travel time. One important variable is compensation. Some of the representatives are paid a salary plus a commission on sales; others work entirely for a larger commission on sales. The marketing managers suspect that there is a difference between the two groups in their effectiveness, although some of them argue that the important factor is the combination of commission status and number of outlets. In particular, they suspect that commission- only representatives with many outlets to cover are highly productive. Also, the managers suspect that profit may be inflated for representatives with many outlets; they would prefer measuring profit per outlet. Data are collected on 51 representatives. The data include DISTRICT number, PROFIT (net profit margin for all orders placed through the representative—the de-pendent variable of interest), AREA (of the district in thousands of square miles), POPN (millions of people in the district), OUTLETS (number of outlets in the district), and COMMIS, which is 1 for full-commission representatives and 0 for partially salaried representatives. 

**Your task** 

**Part A** : Use the data to perform a multiple regression analysis. Find out if the variables suspected by the managers as having an effect on PROFIT actually do have an effect; in particular, try to discover if there is a combination effect of COMMIS and OUTLETS. Consider whether PROFIT itself or PROFIT divided by OUTLETS works better as a dependent variable. 

**Part B** : Omit variables that show little predictive value. 

**Part C** : Locate and, if possible, correct any serious violations of assumptions. 

**Part D** : Once you have completed Parts A, B, and C, please write a brief report (not to exceed 500 words) to the marketing managers and explain your findings; the managers are not familiar with the technical language of statistics, although they do have an idea what a standard deviation is. 


