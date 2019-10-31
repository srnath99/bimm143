Class6 R Functions
================
Shilpa Nath
10/17/2019

\#This is H1 This is my work from class6 in **BIMM143**

\#\#This is h2

\#\#\#This is h3

\#\#Practice reading files (again…)

``` r
plot(1:10)
```

![](Class6_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
read.table("test1.txt")
```

    ##               V1
    ## 1 Col1,Col2,Col3
    ## 2          1,2,3
    ## 3          4,5,6
    ## 4          7,8,9
    ## 5          a,b,c

``` r
read.table("test2.txt")
```

    ##               V1
    ## 1 Col1$Col2$Col3
    ## 2          1$2$3
    ## 3          4$5$6
    ## 4          7$8$9
    ## 5          a$b$c

``` r
read.table("test3.txt")
```

    ##   V1 V2 V3
    ## 1  1  6  a
    ## 2  2  7  b
    ## 3  3  8  c
    ## 4  4  9  d
    ## 5  5 10  e

``` r
read.table("test1.txt", sep=",", header=TRUE)
```

    ##   Col1 Col2 Col3
    ## 1    1    2    3
    ## 2    4    5    6
    ## 3    7    8    9
    ## 4    a    b    c

``` r
read.table("test2.txt", sep="$", header=TRUE)
```

    ##   Col1 Col2 Col3
    ## 1    1    2    3
    ## 2    4    5    6
    ## 3    7    8    9
    ## 4    a    b    c

``` r
read.table("test3.txt", sep="", header=TRUE)
```

    ##   X1 X6 a
    ## 1  2  7 b
    ## 2  3  8 c
    ## 3  4  9 d
    ## 4  5 10 e

``` r
name.of.function <- function(arg1, arg2) {
 statements
 return(something)
}
```

``` r
add <- function(x, y=1) {
 # Sum the input x and y
 x + y
}
```

``` r
add(1)
```

    ## [1] 2

``` r
#add(5,5,5)
add( c(1, 2, 3) )
```

    ## [1] 2 3 4

``` r
add( c(1, 2, 3), 4 )
```

    ## [1] 5 6 7

``` r
rescale <- function(x) {
 rng <-range(x, na.rm = TRUE)
 (x - rng[1]) / (rng[2] - rng[1])
}
```

``` r
rescale(1:10)
```

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

``` r
rescale( c(1,2,NA,3,10) )
```

    ## [1] 0.0000000 0.1111111        NA 0.2222222 1.0000000

``` r
rescale3 <- function(x, na.rm=TRUE, plot=FALSE) {
 rng <-range(x, na.rm=na.rm)
 print("Hello")
 answer <- (x - rng[1]) / (rng[2] - rng[1])
 print("is it me you are looking for?")
 if(plot) {
 plot(answer, typ="b", lwd=4)
 }
 print("I can see it in ...")
 return(answer)
}
```

``` r
rescale3(1:10, plot=TRUE)
```

    ## [1] "Hello"
    ## [1] "is it me you are looking for?"

![](Class6_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

    ## [1] "I can see it in ..."

    ##  [1] 0.0000000 0.1111111 0.2222222 0.3333333 0.4444444 0.5555556 0.6666667
    ##  [8] 0.7777778 0.8888889 1.0000000

\#Section2 of hands-on sheet

Install the **bio3d** package for sequence and structure analysis

``` r
#install.packages("bio3d")
```

``` r
library(bio3d)
readprotein <- function(x) {
sx <- read.pdb(x)
sx.chainA <- trim.pdb(sx, chain="A", elety="CA")
sx.b <- sx.chainA$atom$b
plotb3(sx.b, sse=sx.chainA, typ="1", ylab="Bfactor")
}
```
