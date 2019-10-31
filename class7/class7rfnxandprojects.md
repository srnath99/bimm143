class 7 r function and packages
================
Shilpa Nath
10/22/2019

## R functions revisited

Source my functions from last
    day

``` r
source("http://tinyurl.com/rescale-R")
```

``` r
rescale(1:10)
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

``` r
rescale(c(1,10,5,NA,6))
```

    ## [1] 0.0000000 1.0000000 0.4444444        NA 0.5555556

write a fnx to find where the na elements in two input vectors

First make some simple input where I know the answer

``` r
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3, 4)
```

Looked online and found the **is.na()** fnx

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

``` r
is.na(y)
```

    ## [1]  TRUE FALSE  TRUE FALSE FALSE

The AND fnx requires two input TRUE to give a TRUE output

``` r
is.na(x) & is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

Taking the **sum()** of TRUE FALSE vector will tell me how many TRUE
elements I have. This is my working snippet.

``` r
sum(is.na(x) & is.na(y))
```

    ## [1] 1

and the **which()** fnx tells me where the TRUE values are

``` r
which(is.na(x))
```

    ## [1] 3 5

``` r
which(is.na(y))
```

    ## [1] 1 3

Now turn it into a function.

``` r
both_na <- function(x,y) {
  sum(is.na(x) & is.na(y))
}
```

Test fnx

``` r
x <- c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)
```

``` r
both_na(x,y2)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 3

``` r
x2 <- c(NA,NA)
both_na(x2,y2)
```

    ## [1] 3

``` r
x <- c(1, NA, NA)
y3 <- c( 1, NA, NA, NA, NA, NA, NA)
both_na(x, y3)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 4

``` r
 both_na2 <- function(x,y) {
   if(length(x) != length(y)) {
 stop("Input x and y should be the same length")
 }
  sum(is.na(x) & is.na(y))
}
```

``` r
x3 <- c(1,NA,NA,1,NA,NA,1)
y3 <-  c(1,NA,NA,NA,NA,NA,NA,NA)
```

\#Practice

``` r
# student 1
x <- c(100, 100, 100, 100, 100, 100, 100, 90)
# student 2
y <- c(100, NA, 90, 90, 90, 90, 97, 80)

mean(x [-which.min(x)])
```

    ## [1] 100

``` r
mean(y [-which.min(y)])
```

    ## [1] NA

``` r
which.min(y)
```

    ## [1] 8

``` r
y[-which.min(y)]
```

    ## [1] 100  NA  90  90  90  90  97

``` r
mean(y[-which.min(y)], na.rm = TRUE)
```

    ## [1] 92.83333

We have our working code now turn it into a fnx both\_na2 \<-
function(x,y) { if(length(x) \!= length(y)) { stop(“Input x and y should
be the same length”) } sum(is.na(x) & is.na(y)) }

``` r
grade <- function(x,y)
  if(any(is.na(x)) ) {
    warning("Student is missing a homework")
  mean(x[-which.min(x)], na.rm=TRUE)
}
```

``` r
grade2 <- function(x,y)
  if(any(is.na(x)) ) {
    warning("Student is missing a homework")
  sum(x[-which.min(x)], na.rm=TRUE)/length(x)-1
}
```

``` r
url <- "https://tinyurl.com/gradeinput"
read.csv(url, row.names = 1)
```

    ##            hw1 hw2 hw3 hw4 hw5
    ## student-1  100  73 100  88  79
    ## student-2   85  64  78  89  78
    ## student-3   83  69  77 100  77
    ## student-4   88  NA  73 100  76
    ## student-5   88 100  75  86  79
    ## student-6   89  78 100  89  77
    ## student-7   89 100  74  87 100
    ## student-8   89 100  76  86 100
    ## student-9   86 100  77  88  77
    ## student-10  89  72  79  NA  76
    ## student-11  82  66  78  84 100
    ## student-12 100  70  75  92 100
    ## student-13  89 100  76 100  80
    ## student-14  85 100  77  89  76
    ## student-15  85  65  76  89  NA
    ## student-16  92 100  74  89  77
    ## student-17  88  63 100  86  78
    ## student-18  91  NA 100  87 100
    ## student-19  91  68  75  86  79
    ## student-20  91  68  76  88  76

``` r
hw <- read.csv(url, row.names=1)
```

``` r
apply(hw, 1, grade)
```

    ## Warning in FUN(newX[, i], ...): Student is missing a homework
    
    ## Warning in FUN(newX[, i], ...): Student is missing a homework
    
    ## Warning in FUN(newX[, i], ...): Student is missing a homework
    
    ## Warning in FUN(newX[, i], ...): Student is missing a homework

    ## $`student-1`
    ## NULL
    ## 
    ## $`student-2`
    ## NULL
    ## 
    ## $`student-3`
    ## NULL
    ## 
    ## $`student-4`
    ## [1] 88
    ## 
    ## $`student-5`
    ## NULL
    ## 
    ## $`student-6`
    ## NULL
    ## 
    ## $`student-7`
    ## NULL
    ## 
    ## $`student-8`
    ## NULL
    ## 
    ## $`student-9`
    ## NULL
    ## 
    ## $`student-10`
    ## [1] 81.33333
    ## 
    ## $`student-11`
    ## NULL
    ## 
    ## $`student-12`
    ## NULL
    ## 
    ## $`student-13`
    ## NULL
    ## 
    ## $`student-14`
    ## NULL
    ## 
    ## $`student-15`
    ## [1] 83.33333
    ## 
    ## $`student-16`
    ## NULL
    ## 
    ## $`student-17`
    ## NULL
    ## 
    ## $`student-18`
    ## [1] 97
    ## 
    ## $`student-19`
    ## NULL
    ## 
    ## $`student-20`
    ## NULL
