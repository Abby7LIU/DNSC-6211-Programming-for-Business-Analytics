
setwd('/Users/liujingyi/Desktop')

# Part A

## Name of function: cToF
## cToF converts temperature from degrees celcius
##      to degree farenheit
## Input parameters: temperature in Celcius (numeric)
## Return value: temperature in Farenheit (numeric)
cToF <- function(tempInC) {
  f <- tempInC*9/5 + 32
  return (f)
}

## Name of function: fToC
## fToC converts temperature from degrees celcius
##      to degree farenheit
## Input parameters: temperature in Farenheit (numeric)
## Return value: temperature in Celcius (numeric)

fToC <- function(tempInF) {
  c <- (tempInF - 32) * 5/9
  return (c)
}


givenC <- 35.67
givenF <- 87.29

obtainedF <- cToF(givenC)
obtainedC <- fToC(givenF)

sprintf("%.2f degrees celcius is %.2f degrees farenheit", 
      givenC, obtainedF)
sprintf("%.2f degrees celcius is %.2f degrees farenheit", 
      givenF, obtainedC)


# Part C

## Name of function: myFactorial
## myFactorial calculates the factorial of an integer n
##      n has to be positive or 0
## Input parameters: an integer 0 or more
## Return value: integer, 1 or more

myFactorial <- function(user_input) {
  if (user_input == 1) {
    fact = 1
  } else {
    fact = 1
    for (i in 1:user_input) {
      fact = fact * i
    }
  }
  return(fact)  
}


## Name of function: nChooseR
## nChooseR calculates the number of ways one can choose r
##      items from a set of n items
## Input parameters: n (total items, integer); 
##                   r (items to choose, integer)
## Return value: integer, 1 or more
myNChooseR <- function(n, r) {
  bc <- myFactorial(n) / ( myFactorial(r) * myFactorial (n-r))
  return(bc)  
}


## Name of function: myBinom
## myBinom calculates the Binomial probability of x successes in
##         n tries, given a probability of success
## Input parameters: n (total tries/experiments, integer); 
##                   x (numer of successes, integer)
##                   p (probability of success, number between 0 and 1)
## Return value: probability, real number, (between 0 and 1)
myBinom <- function(n, x, p) {
  bc <- myFactorial(n) / ( myFactorial(x) * myFactorial (n-x))
  bprob <- bc*p^x*(1-p)^(n-x)
  return(bprob)  
}

myn <- 10
myx <- 4
myp <- .35

pcalc <- myBinom(myn, myx, myp)
sprintf ("The probability of %d successes in %d tries is %.4f",
         myx, myn, pcalc)

