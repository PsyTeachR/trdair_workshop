dat <- data.frame(subject = c("DB", "FF", "LQ", "MJ"),
           IQ = iq,
           z_score = round(iq_z, 2),
           percentile = round(pnorm(iq_z) * 100))

translate_subscales <- function(x) {
    data_frame(subscale = x[["subscale"]][1],
               items = paste(as.integer(sub("^I", "", x[["item_id"]])),
                   collapse = ", "))
}

read.csv("stars/subscales.csv") %>%
    group_by(subscale) %>%
    do(translate_subscales(.))

## comment here should say something about this script
## - who made it, what's it for
## - any particular version requirements?

## add-on packages
library("dplyr") # data processing
library("tidyr") # tidying
library("ggplot2") # plotting
library("lme4") # mixed-effects analysis

## any functions that I have defined
my_func <- function(a, b, c) (a + b) / c
cats_are_cool <- function() cat("cats are cool\n")

## read in data you will be using
dat <- read.csv("my_data.csv")

## the code
my_func(1, 3, 2)
## .. etc.

glimpse(scales)

glimpse(stars_wide)

glimpse(stars)

## map each item to each of the 5 subscales
## I3  --> Ask_For_Help
## I2  --> Interpretation
## I25 --> Self-Concept
## I30 --> Teacher
## I1  --> Test
## I24 --> Worth

glimpse(stars_sub)

glimpse(stars_means)

ggplot(stars_means, aes(subscale, mscore)) + geom_point()

ggplot(stars_means, aes(subscale, mscore, color = subscale)) +
    geom_jitter(alpha = .7)

ggplot(stars_means, aes(subscale, mscore, color = subscale)) +
    geom_jitter(alpha = .7) +
    geom_violin(aes(fill = subscale), alpha = .2) +
    stat_summary(fun.y = 'median', geom = "point", size = 5)

ggplot(stars_means, aes(subscale, mscore, color = subscale)) +
    geom_jitter(alpha = .7) +
    geom_violin(aes(fill = subscale), alpha = .2) +
    stat_summary(fun.y = 'median', geom = "point", size = 5) +
    coord_flip()

ggplot(stars_means, aes(subscale, mscore, color = subscale)) +
    geom_jitter(alpha = .7) +
    geom_violin(aes(fill = subscale), alpha = .2) +
    stat_summary(fun.y = 'median', geom = "point", size = 5) +
    coord_flip() + 
    facet_wrap(~year)
