## Day 2 of R course
### Andrew and Alathea
#### 29 de setembro de 2015
## that was awesome
## i learned a lot

###Code/Insert section -- organizando o script em sessões

# load packages -----------------------------------------------------------

library(ggplot2)


# load data ---------------------------------------------------------------

gapminder <- read.csv("data/gapminder.csv")


# load functions ----------------------------------------------------------

source("scripts/functions.R")

# subsseting review -------------------------------------------------------

##methos of subsetting
# x[a] for vectors
x <- c(10:1)
x
x[3]


# x[a,b] for matrices, data frames, not lists

# x["a"] for call the name of an element, like column, row, or part of a list
x <- c(1:10)
names(x) <- letters[1:10]
x
x["b"]

# x[[a]] for lists and data frames
x <- list(c(1:10), c(10:20))
x
x[[1]]

# x$a call a column or a part os a list or data frame
names(x) <- c("one", "two")
x
x$two


###more complex subsetting

# >, <, ==

gapminder[gapminder$country=="Brazil",] ##call elements really equal to a something

x <- c(1:10)
x
x[x>7]
x[x<3]

# %in%
x <- c(1:10)
names(x) <- letters[1:10]
x
x[names(x) %in% c("b", "c", "d")]
x[x%in%c(2,3,4)]


#exercise
gapminder [gapminder$year==1957,]

gapminder[-c(1:4)]

gapminder[gapminder$lifeExp>80,]

gapminder[1, c(4:5)]

gapminder[gapminder$year == 2002 | gapminder$year ==2007,] #or
a <- gapminder [gapminder$year == 2002,]
b <- gapminder [gapminder$year == 2007,]
rbind(a,b) #or
gapminder[gapminder$year %in% c(2002, 2007),]



# plotting review ---------------------------------------------------------

ggplot(data=gapminder, aes(x=lifeExp, y= gdpPercap))+geom_point()

ggplot(data=gapminder, aes(x=lifeExp, y= gdpPercap, colour = continent))+geom_point()

ggplot(data=gapminder, aes(x=lifeExp, y= gdpPercap, colour = continent))+geom_point()

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent))+geom_point() +stat_smooth(method="lm")

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent))+geom_point() +stat_smooth(method="lm")

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent, group=country))+geom_point() +geom_line()

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent, group=country))+geom_point() +geom_line()+scale_y_log10()

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent, group=country))+geom_point(colour="black") +geom_line()+scale_y_log10()

ggplot(data=gapminder, aes(x=year, y= pop, colour = continent, group=country))+geom_line()+geom_point(colour="black")+scale_y_log10()


ggplot(data=gapminder, aes(x=year, y= pop, colour = continent, group=country))+geom_line()+geom_point(colour="black")+scale_y_log10() + facet_wrap(~continent)

ggplot(data=gapminder,aes(x=lifeExp, y=gdpPercap))+geom_point(size=1.5, colour="brown")+scale_y_log10()+geom_smooth(method="lm", size=1.0, colour="black")

###ggplot cheat sheet
###ggplotdocumentation

head(gapminder)

###density plots
ggplot(gapminder, aes(x=gdpPercap)) + geom_density(aes(x=continent, colour = continent, fill=continent, alpha=0.1))

ggplot (gapminder, aes(x=gdpPercap, colour=continent, fill=continent)) + geom_density(alpha=0.5) + facet_wrap(~year) + scale_x_log10()

ggplot (gapminder, aes(x=gdpPercap, fill=continent)) + geom_density(alpha=0.5) + facet_wrap(~year) + scale_x_log10() + ggtitle("PIB por Continente") + ylab ("Densidade de PIB") + xlab ("PIB") + labs (fill = "Continente")


# saving a plot -----------------------------------------------------------

ggsave("figures/density_plot.pdf")
#ou salvar em outros formatos

pdf(file="figures/pdf_density_plot.pdf", height = 7)
ggplot(gapminder, aes(x=gdpPercap)) + geom_density(aes(x=continent, colour = continent, fill=continent, alpha=0.1))
dev.off()

#challenge - multiple plots
pdf(file="figures/pdf_density_plot_multi.pdf", height = 7)

ggplot(gapminder, aes(x=gdpPercap)) + geom_density(aes(x=continent, colour = continent, fill=continent, alpha=0.1))

ggplot (gapminder, aes(x=gdpPercap, fill=continent)) + geom_density(alpha=0.5) + facet_wrap(~year) + scale_x_log10() + ggtitle("PIB por Continente") + ylab ("Densidade de PIB") + xlab ("PIB") + labs (fill = "Continente")

ggplot(data=gapminder,aes(x=lifeExp, y=gdpPercap))+geom_point(size=1.5, colour="brown")+scale_y_log10()+geom_smooth(method="lm", size=1.0, colour="black") + facet_grid (~continent)


dev.off()


# Working with data frames ------------------------------------------------

#rbind and cbind can add rows and columns to data frames

head(iris)

#add a new column 

iris$Family <- "Iridaceae"
head(iris)

#add a column using data from the data frame

iris$Petal.Area <- iris$Petal.Width*iris$Petal.Length
head(iris)
iris$Sepal.Area <- with(iris, Sepal.Width*Sepal.Length)
head(iris)

#summary stats
mean_petal_width <- mean(iris$Petal.Width)
sd_petal_width <- sd(iris$Petal.Width)
median(iris$Petal.Width)
sd_petal_width/mean_petal_width

mean_sepal_length <- mean(iris$Sepal.Length)
sd_sepal_length <- sd(iris$Sepal.Length)
sd_sepal_length/mean_sepal_length


# R Functions -------------------------------------------------------------

#about sources and directories
#to go down - "/"
#to go up - "../"

cal_CV(iris$Sepal.Length)
cal_CV(iris$Sepal.Width)
cal_CV(iris$Petal.Area)
cal_CV(gapminder$gdpPercap)

#area of a circle

circum_to_diameter(30)
circum_to_diameter(3)


###Challenge: write a function that calculates the radius from the diameter

radius_from_diameter(10)


#area a partir do raio
radius_to_area(2)

#area a partir da circunferencia
area_from_circum(40)


###make a data.frame

circs <- data.frame(xs=10:200)
head(circs)
circs$areas <- area_from_circum(circum=circs$xs)
head(circs)

ggplot(circs, aes(x=xs, y=areas))+geom_point (colour="blue", size=5.0, alpha=0.5)+geom_line(colour="red", size=1.0)


# saving data -------------------------------------------------------------

brazil <- gapminder[gapminder$country == "Brazil",]
brazil

write.table(x = brazil, file = "cleaned_data/brazil_data.csv", sep = ",")

write.table(x = brazil, file = "cleaned_data/brazil_data.csv2", sep = ",", row.names=FALSE, quote=FALSE) #quote remove aspas

write.table(x = brazil, file = "cleaned_data/brazil_data.csv3", sep = "\t", row.names=FALSE, quote=FALSE)



#challenge
head(gapminder)
gapminder_since_1990 <- gapminder[gapminder$year>1990,]

write.table(x=gapminder_since_1990, file="cleaned_data/gapminder_since_1990.csv", sep="\t", row.names=FALSE, quote=FALSE)