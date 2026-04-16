

# PACAKAGES ---------------------------------------------------------------


library(dplyr)
library(readxl)

# IMPORT  -----------------------------------------------------------------


INFEC <- read_excel("INFEC.xlsx")

# table(fator, desfecho)
t1 <- table(INFEC$INFECCAO, INFEC$Y)

# correcao das colunas da tabela
tabela1 <- cbind(t1[,2], t1[,1])
colnames(tabela1) <- c("SIM", "NAO")

epi.2by2(tabela1)

# table(fator, desfecho)
t2 <- table(INFEC$TRATAMENTO, INFEC$Y)

# correcao das colunas da tabela
tabela2 <- cbind(t2[,2], t2[,1])
colnames(tabela2) <- c("SIM", "NAO")

tabela2[1:2,]

epi.2by2(tabela2[1:2,])

epi.2by2(tabela2[2:3,])
