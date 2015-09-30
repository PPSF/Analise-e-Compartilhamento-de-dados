### Functions
###for analyzing gapminder data
### PPSF - setembro/2015

#criando uma função para calcular CV
#takes a vector of numbers
#returns the CV

name <- function(variables){
  
}

cal_CV <- function (x){
  mean_x <- mean(x)
  sd_x <- sd(x)
  CV <- sd_x/mean_x
  return(CV)
}

##go from circunference to diameter
circum_to_diameter <- function(circ){
  diam <- circ/pi
  return(diam)
}


#calculate the radius from the diameter
radius_from_diameter <- function(diam){
  radius <- diam/2
  return(radius)
}

#area of a circle - radius to area
radius_to_area <- function(radius){
  area <- pi * radius^2
  return(area)
}

###starts with a circumference and get the area
area_from_circum <- function(circum){
  #get the diameter from circumference
  diam <- circum_to_diameter(circum)
  #get the radius
  rad <- radius_from_diameter(diam)
  #calculate area from radius
  Area <- radius_to_area(rad)
  return(Area)
}



