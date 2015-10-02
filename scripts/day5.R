## introduction to statistics in R
### day 5


# Load data ---------------------------------------------------------------

gapminder <- read.csv("data/gapminder.csv")
head(gapminder)


# load packages -----------------------------------------------------------

library(dplyr)
library(ggplot2)
library(car)

# probability distributions -----------------------------------------------

###normal distributions

random.normal <- rnorm(n=300, mean=10, sd=4)
random.normal

random.df <- data.frame(rn=random.normal)

ggplot(random.df, aes(x=rn)) + geom_density()

plot(curve(dnorm(x), from=-2, to=2), type="l", xlim=c(-3,3))


###poisson distributions

random.df$randpois <- rpois (300, 4)

ggplot(random.df, aes(x=randpois)) + geom_density()


###curve for lines

popu <- function(x){
  2*x^0.75
}
popu(4)
popu(40)
popu(400)

plot(curve(popu(x)))



# Linear Models -----------------------------------------------------------

head(gapminder)
lm.gap <- lm(pop~year, data=gapminder)
summary(lm.gap)

lm.gap2 <- lm(pop~year*continent, data=gapminder)
summary(lm.gap2)

###checking residuals
model4 <- lm(pop~year, data=gapminder)
summary(model4)
plot(model4) #é possível verificar a normalidade dos resíduos pelo Q-Q plot do gráfico

#transform the response variable
model5 <- lm(log(pop)~year, data=gapminder)
plot(model5)
hist(resid(model5))


###sums of squares with car package

##without car
model1 <- lm(pop~year*gdpPercap, data=gapminder)
anova(model1)
model2 <- lm(pop~gdpPercap*year, data=gapminder)
anova(model2)

##with car
Anova(model1, type="III")
Anova(model2, type="III")
Anova(model1, type="II")
Anova(model2, type="II")


###GLMs with poisson distributions

model6 <- glm(pop~year, data=gapminder, family=poisson)
plot(model6)
summary(model6)

model7 <- glm(pop~year, data=gapminder, family=quasipoisson)
plot(model7)
summary(model7)
