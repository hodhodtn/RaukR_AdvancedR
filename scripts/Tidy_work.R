library(tidyverse)
library(magrittr)
read_csv(readr_example('challenge.csv'), col_types = cols(x=col_double())) %>% tail()

my_cars <- mtcars[, c(1:4, 10)]
my_cars <- my_cars[my_cars$disp > mean(my_cars$disp), ]
my_cars <- colMeans(my_cars)


mtcars %>% select(mpg)
mtcars %>% select(1:4,10) %>% filter(disp > mean(disp)) %>% map(mean)

cars %T>% {print(summary(.))} %>% colSums()

dim_summary <- function(nrows, ncols) {
  print(
    paste0('Matrix M has: ', nrows, ' rows and ', ncols, ' columns.')
  )
}

distr1 <- rnorm(16)
M <- matrix(distr1, ncol = 4)
plot(M)
M <- M + sample(M)
dim_summary(nrows = nrow(M), ncols = ncol(M))
distr2 <- rnorm(16)


M = rnorm(16) %>% matrix(ncol = 4)
M %T>% plot() %>% `+`(.,.) %T>% {dim_summary(nrows = nrow(.), ncols = ncol(.))}

N <- matrix(distr2, ncol = 4)
colnames(N, letters[1:4])
summary(N)

rnorm(16) %>% matrix(ncol = 4) %>% `colnames<-` (letters[1:4])

mtcars %>% head()

library(microbenchmark)
tst <- replicate(30, sample(100), simplify = TRUE)
names(tst) = paste0(rep('col', times = dim(tst)[2]), 1:dim(tst)[2])
microbenchmark::microbenchmark(
  as.data.frame(tst),
  as_data_frame(tst),
  as_tibble(tst)
)

tibble(x = sample(1:10, size = 10, replace = T), y = log10(x))

vec1 <- c(1, 7.2, 3.84, -5.23)
as.double(vec1)
as.integer(vec1)

vec4 <- c('barrel: 432.7$', 'liter: 15.42PLN', 'gallon costs approx 32.1SEK', 'sunny, wind gusts up till 55m/s')
parse_guess(vec4)
guess_parser(vec4)
parse_number(vec4)



library('nycflights13')
??nycflights13
flights %>% select(-c(carrier,arr_time))
v <- c("arr_time", "sched_arr_time", "arr_delay")
select(one_of(v))

flights %>% filter(dep_delay<30 & dep_delay>10)
flights %>% select(arr_time)
flights %>% filter(is.na(arr_time))
# show 5 most departure-delayed flights in January per carrier
flights %>% filter(month==1) %>% group_by(carrier) %>% summarise(most=max(n()))

flights %>% distinct(dest)


##################################################
####################  addins  ####################
##################################################

library(devtools)
install_github("MangoTheCat/tidyshiny")
library(tidyshiny)

# Create a dataset object for the gadget to detect
testData <- airquality
tidyData()

# Alternatively pass the data to the tidyData function call
tidyData(iris)

##################################################
##################################################