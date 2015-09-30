# R course by Andrew and Alathea
# Rio, 28 de setembro de 2015

2+2

## objects
x <- 5
x * 2

## math functions
log (x)
log10(x)

?log

## "nome da função"("argumentos")


x
x > 2 ##texto

x == 5 #= duplo -> realmente igual

x <- 1000
x

x <- 1000

## "alt -" = <-


##exercise
mass <- 47.5
age <- 122
mass <- mass *2.3
age <- age - 20

mass > age

Pedro <- 10
Pedro


# Data types

#logical
a <-  TRUE
b <- FALSE

# integer
c <- 5L

#double
d <- 5

#complex number
e <-  1 + 2i

#character
f <- "cat"

## What kind of data type do I have?
typeof(c)
typeof(d)

is.integer(c)

is.logical(c)


#exercise: assign a value to a variable with the characteristic

# logical
answer <- TRUE
# numeric
height <- 10
#character
dog_name <-  "Tom"

is.logical (answer)
is.numeric(height)
is.character(dog_name)




##Data structure

### Vector
vec1 <- vector("character")
vec1

vec2 <- vector("character", length=5)
vec2

vec3 <- c(1,2,3,4,5)
vec3

vec4 <- c(0:100)
vec4

vec5 <- seq(0,100,by = 0.5) #sequência de 0.5 em 0.5 até 100
vec5

vec6 <- c(TRUE, 10L, "cat") #different types of data in a vector
vec6
typeof(vec6)

as.double(vec6)
vec6
#NA = no avaiable

##Getting information about an object's structure
x <- 0:10000

length (x)
str(x)
head(x)
tail(x)

ages <- c(23,24,25,32,49)
ages

names (ages) <- c("Juliana", "Rodrigo", "Carlos", "Bella", "Andrew")
ages

typeof(ages)
?double

## numeric is not a formal type, is a category for numeric type, that includes "double" and "integer" type.



### Matrices

x <- matrix(1:10, nrow=5, ncol=2)
x
str(x)

rownames(x) <- c("a", "b", "c", "d", "e") #nomear linhas
colnames(x) <-  c("a", "b") #nomear colunas
x

##exercise
rnorm(18)
Y <- matrix(rnorm(18), ncol=6, nrow=3)
Y
length(Y)

z <- matrix (1:50, ncol=5, nrow=10)
z
?matrix
z <- matrix (1:50, ncol=5, nrow=10, byrow=TRUE) #default é preencher pela coluna (byrow=FALSE).
z
z <- matrix (1:50, ncol=5, byrow=10)
z

##Factors - variáveis categóricas
x <- factor (c("yes", "no", "yes", "yes"))
x
typeof(x)
str(x)

x <- factor (c("case", "control", "control", "case"), levels = c("control", "case"))
str(x)



###Lists: contain multiple data types

x <- list (1, "a", TRUE, 5L)
x
xlist <- list(name="Iris Data", nums=1:10, data=head(iris))
xlist


###Data frame

df <-  data.frame(a=c(1,2,3),b=c("a!", "b", "c"), c=c(TRUE, FALSE, FALSE))
df

#matrix tem apenas um tipo de dados, enquanto data frame tem vários tipos de dados

#exercise

df <- data.frame(id=c("a", "b", "c", "d", "e", "f"), x=1:6, y=c(214:219))
df

length(df)

#Adding rows and columns to data frames
rbind(df, df) #row bind
cbind (df, df) #colum bind


#exercise
dframe <- data.frame (first="Pedro", last="Ferreira", age="23")
dframe
dframe2 <- data.frame (first="Marina", last="Moreira", age="30")
god <- rbind(dframe,dframe2)
dframe3 <- data.frame (first="Vinicius", last="Giglio", age="31")
rbind (god, dframe3)



###subsetting
####taking out parts of larger objects

x <- c(5.4,6.2,7.1,4.8,7.5)
names(x) <- c("a", "b","c","d","e")
x
typeof(x)

x[1]
x
x[3]
x[c(3,5)] #vetor do objeto "x"

x[2:4]
x[c(1,1,1,5)]
x[1:5]
x[5:1]

##skipping elements
x[-1]
x[-c(2,4)]


#exercise
a <- x[2:4]
b <- x[c(2, 3, 4)]
c <- x[-c(1,5)]
d <- x[c("b", "c", "d")]
e <- x[c(FALSE, TRUE, TRUE, TRUE, FALSE)]


#subsetting by name
x["a"]
names(x)
names(x) == "c"

isitc <- names(x) == "c"
x[isitc]


#for matching multiple things
names(x) %in% c("b", "c", "d") ## %in% calls the vector inside the first one
x[names(x) %in% c("b", "c", "d")] #para chamar as colunas b, c, d dentro do data frame x, por exemplo


###multiple conditions
a <- 1:10
a
a>7
a[a>7] ##getting a small subset of vector a
a[a>=7]


TRUE & TRUE
TRUE & FALSE
TRUE|TRUE
TRUE|FALSE
1:5 * 10
1:5*1:5


#exercise
x
x<4
a <- x>4
b <- x<7
d <- a&b
d
x[d]
x
x [x>4 & x<7]


as.numeric (FALSE)
as.numeric (TRUE)

#how many times is x greater than 6???
as.numeric (x>6)
sum (x>6)

##matrices
set.seed(1)
m <- matrix(rnorm(6*4), ncol=4, nrow=6)
m
##getting first 3 rows, second and third columns
m[1:3, c(2,3)]
m[,3] ##third column
m[3,] ##third line
m[1:2,] ##linhas 1 até 2


##subsetting lists
xlist <- list (a="UFRJ", b=1:10, c=head(iris))
xlist

xlist[1] #a box from the list, but still a box for the list
xlist["a"] #a box from the list, but still a box for the list
xlist$a #the name, or the content, from the box of the list
xlist[[1]] #the name, or the content, from the box of the list
xlist[["a"]] #the name, or the content, from the box of the list

typeof(xlist[1]) #a box from the list, but still a box for the list
typeof(xlist$a) #the name, or the content, from the box of the list

xlist
xlist$b[2] #chamar um objeto do vetor "b" da lista



##reading list
gapminder <- read.csv("gapminder.csv")
head(gapminder)
str(gapminder)


gapminder[,5]
gapminder$pop
gapminder[,"pop"]

gapminder[1:2,]
gapminder$country == "Brazil"
BRASIL <- gapminder$country == "Brazil"
gapminder [BRASIL,]


##plotting
library(ggplot2)

##lifeExp and GDP
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap)) + geom_point() #aes = qual parte da figura (eixo) corresponde com qual parta do data frame

## GDP over time
ggplot(data=gapminder, aes(x=year, y=gdpPercap)) + geom_point()

##colour by country
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap, colour = country)) + geom_point()

##line plots
ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) + geom_line()
ggplot(data=gapminder, aes(x=year, y=lifeExp, colour=country)) + geom_line() + geom_point ()
ggplot(data=gapminder, aes(x=year, y=lifeExp)) + geom_line(aes(colour=country))+geom_point()


##transformations and statistics
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + geom_point () + scale_y_log10()
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap)) + geom_point () + scale_y_log10() + stat_smooth(method = "lm")

ggplot(gapminder, aes(x=lifeExp, y=gdpPercap, colour=continent)) + geom_point () + scale_y_log10() + stat_smooth(method = "lm")




gm90 <- gapminder[gapminder$year > 1990, ]
head(gm90)

ggplot (gm90, aes(x=lifeExp, y=gdpPercap))+geom_point()+scale_y_log10()+geom_smooth(method="lm") + facet_wrap(~year) #facet wrap mostra gráfico por ano

ggplot (gm90, aes(x=lifeExp, y=gdpPercap))+geom_point()+scale_y_log10()+stat_smooth(method="lm") + facet_wrap(~year) #facet wrap mostra gráfico por ano

##stat = geom ?

ggplot (gm90, aes(x=lifeExp, y=gdpPercap))+geom_point()+scale_y_log10()+geom_smooth(method="lm") + facet_grid(continent~year) #grid plotando ano X continente

