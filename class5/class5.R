#' ---
#' title: "Class5 Data Exploration and Visualization in R"
#' author: "Shilpa Nath "
#' output: github_document
#' ---

baby <- read.delim("bimm143_05_rstats/weight_chart.txt")
head(baby)
plot(baby$Age, baby$Weight)
#plot(weight$Age, weight$Weight, typ="o")

plot(baby$Age, baby$Weight, typ="o", pch=15, cex=1.5, lwd=2, ylim=c(2,10),xlab="Age(months)", ylab="Weight(kg)", main="Baby weight with age", col="blue")

mouse <- read.delim("bimm143_05_rstats/feature_counts.txt")
barplot(mouse$Count)

par(mar=c(5, 11, 5, 2))
#head(mouse)
barplot(mouse$Count, names.arg=mouse$Feature, horiz=TRUE, ylab="", main="Number of features in the mouse GRCm38 genome", las=1)

par(mar=c(5,11,2,2))
barplot(mouse$Count, names.arg = mouse$Feature, horiz = TRUE, ylab = "", main = "Number of features in the mouse GRCm38 genome", las=1, xlim=c(0,80000))

x <- c(rnorm(10000), rnorm(10000)+4)
hist(x, breaks=80)

mf <-read.delim("bimm143_05_rstats/male_female_counts.txt")
head(mf)
barplot(mf$Count, names.arg = mf$Sample, col = rainbow(nrow(mf)), las=2, ylab = "Counts")
barplot(mf$Count, names.arg=mf$Sample, col=c("blue2", "red2"), las=2, ylab="Counts")

genes <- read.delim("bimm143_05_rstats/up_down_expression.txt")
nrow(genes)
table(genes$State)
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")
palette(c("blue", "gray", "red"))
plot(genes$Condition1, genes$Condition2, col=genes$State, xlab="Expression condition 1", ylab="Expression condition 2")

meth <- read.delim("bimm143_05_rstats/expression_methylation.txt")
nrow(meth)
plot(meth$gene.meth, meth$expression)
