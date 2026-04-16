install.packages("epiR")

library(epiR)

# EXAMPLE 1 ----------------------------------------------------------------


dat <- matrix(c(40,20,16,48),
              nrow = 2, 
              byrow = TRUE
              )

#default_method = cahort.count
epi.2by2(dat)
epi.2by2(dat, units = 1)

#methods: estudo corte
epi.2by2(dat, method = "cohort.count")


# EXAMPLE 2 ---------------------------------------------------------------


dat1<- matrix(c(355,125,410,190),
              nrow = 2,
              byrow = TRUE
              )

#methods: estudo tranversal
epi.2by2(dat1, method = "cross.sectional")


# EXAMPLE 3 ---------------------------------------------------------------


dat2<- matrix(c(96,109,104,666), nrow = 2, byrow = TRUE)

#methods: estudo caso controle
epi.2by2(dat2, method = "case.control")
