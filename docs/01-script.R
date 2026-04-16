####################
## EXEMPLO 1      ##
## RISCO RELATIVO ##
####################
DADOS<-matrix(c(40,20,16,48),2,2,byrow=T)
IDADOS<-prop.table(DADOS,1)
IE= IDADOS[1]#DADOS[1]/sum(DADOS[1,])
IEC=IDADOS[2]#DADOS[2]/sum(DADOS[2,])
RR<-IE/IEC
f<-log(RR)
VF<-(1-IE)/(sum(DADOS[1,])*IE)+
  (1-IEC)/(sum(DADOS[2,])*IEC)
# LIMITE INFERIOR IC95%
exp(f-1.96*sqrt(VF))
# LIMITE SUPERIOR IC95%
exp(f+1.96*sqrt(VF))
## A probabilidade de melhora dos pacientes submetidos ao
## novo tratamento foi estimada em 2.67 vezes a dos pacientes
## que receberam placebo, com respectivo IC de 95% igual a
## (1,68;4,22). Como o IC não inclui o número 1, conclui-se que há
## evidencias a favor do novo medicamento.
######################
## EXEMPLO 1        ##
## RISCO ATRIBUIVEL ##
######################
DADOS<-matrix(c(40,20,16,48),2,2,byrow=T)
IE=DADOS[1]/sum(DADOS[1,])
IEC=DADOS[2]/sum(DADOS[2,])
d_chapeu<-IE-IEC
Vd<-(1-IE)*IE/(sum(DADOS[1,])-1)+
  (1-IEC)*IEC/(sum(DADOS[2,])-1)
# LIMITE INFERIOR IC95%
(d_chapeu-1.96*sqrt(Vd))
# LIMITE SUPERIOR IC95%
(d_chapeu+1.96*sqrt(Vd))
d_chapeu
## O risco atribuível à melhora dos pacientes submetidos ao
## novo tratamento foi estimado em 0.417 maior ao dos pacientes
## que receberam placebo, com respectivo IC de 95% igual a
## (0,2557;0.5776). Como o IC não inclui o número 0, conclui-se que há
## evidencias a favor do novo medicamento.
######################
## EXEMPLO 1        ##
## RAZAO DE CHANCES ##
######################
DADOS<-matrix(c(40,20,16,48),2,2,byrow=T)
OR<-DADOS[1,1]*DADOS[2,2]/(DADOS[1,2]*DADOS[2,1])
f_chapeu<-log(OR)
VF<-1/DADOS[1,1]+1/DADOS[1,2]+1/DADOS[2,1]+1/DADOS[2,2]
# LIMITE INFERIOR IC95%
exp(f_chapeu-1.96*sqrt(VF))
# LIMITE SUPERIOR IC95%
exp(f_chapeu+1.96*sqrt(VF))
## A chance de melhora dos pacientes submetidos ao
## novo tratamento foi estimada em 6 vezes a dos pacientes
## que receberam placebo, com respectivo IC de 95% igual a
## (2,75;13,09). Como o IC não inclui o número 1, conclui-se que há
## evidencias a favor do novo medicamento.
################
## Do exemplo 2
################
DADOS<-matrix(c(355,125,410,190),2,2,byrow=T)  # exemplo 2
OR<-DADOS[1,1]*DADOS[2,2]/(DADOS[1,2]*DADOS[2,1])
f_chapeu<-log(OR)
VF<-1/DADOS[1,1]+1/DADOS[1,2]+1/DADOS[2,1]+1/DADOS[2,2]
# LIMITE INFERIOR IC95%
exp(f_chapeu-1.96*sqrt(VF))
# LIMITE SUPERIOR IC95%
exp(f_chapeu+1.96*sqrt(VF))
## A chance de apresentar sintomas de doenças respiratorias 
## dos pacientes do sexo feminino foi estimada em  1.32 vezes a 
##  dos pacientes do sexo masculino, com respectivo IC de 95% 
## igual a (1.01;1,71). Como o IC inclui não inclui o número 1, 
## conclui-se que há evidencias de associacao entre a chance
## de apresentar os sintomas e o sexo biologico dos pacientes. 
# IC 99%
DADOS<-matrix(c(355,125,410,190),2,2,byrow=T)  # exemplo 2
OR<-DADOS[1,1]*DADOS[2,2]/(DADOS[1,2]*DADOS[2,1])
f_chapeu<-log(OR)
VF<-1/DADOS[1,1]+1/DADOS[1,2]+1/DADOS[2,1]+1/DADOS[2,2]
# LIMITE INFERIOR IC99%
exp(f_chapeu-2.58*sqrt(VF))
# LIMITE SUPERIOR IC99%
exp(f_chapeu+2.58*sqrt(VF))
## A chance de apresentar sintomas de doenças respiratorias 
## dos pacientes do sexo feminino foi estimada em  1.32 vezes a 
##  dos pacientes do sexo masculino, com respectivo IC de 99% 
## igual a (0.92;1,86). Como o IC inclui inclui o número 1, 
## conclui-se que não há evidencias de associacao entre a chance
## de apresentar os sintomas e o sexo biologico dos pacientes. 