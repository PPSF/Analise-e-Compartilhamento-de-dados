## R course - day 4
### 1 de outubro de 2015


#install dplyr
install.packages("dplyr")

#install tidyr
install.packages("tidyr")


# load packages -----------------------------------------------------------

library(dplyr)
library(tidyr)
install.packages("car")


# import data -------------------------------------------------------------

gapminder <- read.csv("data/gapminder.csv")
head(gapminder)


# using dplyr -------------------------------------------------------------

#without dplyr - get the mean gdp of a continent
asia <- gapminder[gapminder$continent=="Asia",]
mean_asia_gdp <- mean(asia$gdpPercap)
mean_asia_gdp


# main function of dplyr --------------------------------------------------

## --- select()

gdp_df <- select(gapminder, gdpPercap) #(name of data set, column)
gdp_df
View (gdp_df) #ver como uma tabela!

gdp_by_country <- select(gapminder, gdpPercap, country)
View(gdp_by_country)

View(select(gapminder, -pop)) #menos remove a coluna especificada


## --- filter() : choose the rows u want

gapminder_europe <- filter(gapminder, continent == "Europe")
View(gapminder_europe)

gm_europe_gdp <- select(gapminder_europe, year, country, gdpPercap)
View(gm_europe_gdp)

##pipe operator: %>% or ctrl+shift+m

gm_europe_gdp <- gapminder %>%  filter(continent=="Europe") %>% select (year, country, gdpPercap)
View(gm_europe_gdp)

#challenge: 624 lines
gapminder_african <- gapminder %>% filter (continent=="Africa") %>% select (country,lifeExp, year)
View(gapminder_african)
nrow(gapminder_african)


## --- group_by(): separate the data frame into groups in order to perform some analysis on each group at the same time

gapminder_grouped <- gapminder %>% group_by(continent)
gapminder_grouped
View (gapminder_grouped)


## --- summarize()

gapminder_mean_gdp <- gapminder %>% group_by(continent) %>% summarize (mean_gdpPercap=mean(gdpPercap))
View(gapminder_mean_gdp)

#challenge:

gapminder_lifeexp_avg <- gapminder %>% group_by(country) %>% summarize (mean_lifeExp=mean(lifeExp)) %>% arrange(mean_lifeExp)
View(gapminder_lifeexp_avg)
#--

gdp_continent_year <- gapminder %>% group_by(continent, year) %>% summarize(mean_gdpPercap = mean(gdpPercap), sd_gdpPercap=sd(gdpPercap))
View(gdp_continent_year)


## --- mutate(): add a new column inside a pipe

gdp_pop_millions <- gapminder %>% mutate(pop_millions=pop/10^6)
View(gdp_pop_millions)

#challenge

set.seed(1)

gapminder %>% filter(year==2002) %>% group_by(continent) %>% sample_n(2) %>% summarize(mean_lifeExp = mean(lifeExp)) %>% arrange(desc(continent))



# Tidyng data with tidyr --------------------------------------------------

gap_wide <- read.csv("cleaned_data/gap_wide.csv")
head(gap_wide)
View(gap_wide)

gap_long <- gather(gap_wide, obstype_year, obs_values, -continent, -country)
head(gap_long)
View(gap_long)
gap_long_sep <- separate (gap_long, obstype_year, into=c("obstype", "year"), sep = "_")
head(gap_long_sep)

str(gap_long_sep) #look at the structure

gap_long_sep$year <- as.numeric(gap_long_sep$year)
str(gap_long_sep)

View(gap_long_sep)


#challenge
gap_long_mean <- gap_long_sep %>% group_by(continent, obstype) %>% summarize(mean_obs=mean(obs_values))
gap_long_mean


###simple example of tyder operations
exemplo <- data.frame (grp=c("a", "a", "b", "b"), foo = c(1,2,3,4), bar=c(5,6,7,8))
exemplo
comprido <- gather(exemplo, key="variable", value="value", foo:bar)
comprido
comprido %>% group_by(grp, variable) %>% summarize(mean_value=mean(value)) %>% spread(key=variable, value=mean_value)

comprido %>% group_by(grp, variable) %>% mutate(new_name=seq_along(value)) %>% spread(variable, value)


#challenge

###A: calculate the mean population for all countries (and continents)

pop_means <- gapminder %>% group_by(continent, country) %>% summarize (mean_pop=mean(pop))
table.continent <- pop_means %>% spread(key=country,value=mean_pop, fill=0)
View(table.continent)


install.packages("installr")
library(installr)

