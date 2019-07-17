# Programming-for-Business-Analytics
Homeworks and Projects for DNSC 6211 Programming for Business Analytics
## Homework 2
Part A (40 marks)
The dataset mtcars was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
a. Indicate the type of data (categorical or continuous) for each of the variables included in the dataset.
b. For each of the categorical variables in the survey, indicate whether you believe the variable is nominal or ordinal.
c. Create a histogram for each of the continuous variables.
d. Find the maximum and minimum mpg in this sample.
e. Report the mpg at each of the 25th, 50th, and 75th percentiles.
f. Report and interpret the interquartile range for the mpg.
Name your file as A02a_Gwid.r. So if your GWID is G19860011 then you should name your submission file as A02a_G19860011.r. Please make sure that you comment your R code.
Part B (40 marks)
Using the same dataset mtcars that you used in Part A, complete the following using the slides (Basic plots.pdf)
a. Draw a scatterplot with mpg on the y axis and displacement on the x axis. What does the graph tell you (one or two sentences)?
b. Draw histograms for mpg by am in the same plot. What does the graph tell you (one or two sentences)?
Name your file as A02b_Gwid.r. So if your GWID is G19860011 then you should name your submission file as A02b_G19860011.r. Please make sure that you comment your R code.
Part C (20 marks)
All of you must have heard about the central limit theorem (CLT). If not, have a look at this video.
a. Then run the following R commands. Please spend some time trying understand the code well.
Please describe the distribution that you obtain in one or two sentences.
Hint for parts b and c: use the replicate and apply functions; replicate to obtain samples and apply to obtain means of each sample;
  rnorm2 <- function(n,mean,sd) { mean+sd*scale(rnorm(n)) }
set.seed(1239)
r1 <- rnorm2(100,25,4)
r2 <- rnorm2(50,10,3)
samplingframe <- c(r1,r2)
hist(samplingframe, breaks=20,col = "pink")
b. Draw 50 samples of size 15 from the sampling frame in part a, and plot the sampling distribution of means as a histogram.
c. Draw 50 samples of size 45 from the sampling frame in part a, and plot the sampling distribution of means as a histogram.
d. Explain CLT in your own words in one or two sentences based on your answers to parts b and c.
Name your file as A02c_Gwid.r. So if your GWID is G19860011 then you should name your submission file as A02c_G19860011.r. Please make sure that you comment your R code.
