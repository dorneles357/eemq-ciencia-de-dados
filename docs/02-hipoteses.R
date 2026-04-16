#########################
# MEDIDAS DE ASSOCIACAO #
#########################
### DADOS EXEMPLO 1
EX1<-matrix(c(40,16,20,48),2,2)
# OR
OR<-EX1[1,1]*EX1[2,2]/(EX1[1,2]*EX1[2,1])
f_chapeuOR1<-log(OR)
Vf_chapeuOR1<-1/EX1[1,1]+1/EX1[2,2]+
  1/EX1[1,2]+1/EX1[2,1]

li_OR1<-exp(f_chapeuOR1-1.96*
              sqrt(Vf_chapeuOR1))
ls_OR1<-exp(f_chapeuOR1+1.96*
              sqrt(Vf_chapeuOR1))
cbind(OR,li_OR1,ls_OR1)
# foram encontradas evidencias em favor
# do medicamento pois o intervalo n�o 
# inclui o 1. 
# Logo, a chance de melhora dos pacientes
# esta associada ao uso do medicamento
### DADOS EXEMPLO 2
EX2<-matrix(c(355,410,125,190),2,2)
# OR
OR<-EX2[1,1]*EX2[2,2]/(EX2[1,2]*EX2[2,1])
f_chapeuOR2<-log(OR)
Vf_chapeuOR2<-1/EX2[1,1]+1/EX2[2,2]+
  1/EX2[1,2]+1/EX2[2,1]

# z tal que P(Z<=z)=1-alpha/2
alpha<-0.05
z<-qnorm(1-alpha/2) 
li_OR2<-exp(f_chapeuOR2-z*
              sqrt(Vf_chapeuOR2))
ls_OR2<-exp(f_chapeuOR2+z*
              sqrt(Vf_chapeuOR2))
cbind(OR,li_OR2,ls_OR2)
# a um nivel de confianca de 95%
# foram encontradas evidencias de que 
# meninos e meninas nao sao igualmente 
# propensos a apresentar doencas
# respiratorias pois o intervalo n�o 
# inclui o 1. 
# Logo, a chance de ter a doenca e
# ligeiramente superior entre as meninas
# z tal que P(Z<=z)=1-alpha/2
alpha<-0.01
z<-qnorm(1-alpha/2) 
li_OR2<-exp(f_chapeuOR2-z*
              sqrt(Vf_chapeuOR2))
ls_OR2<-exp(f_chapeuOR2+z*
              sqrt(Vf_chapeuOR2))
cbind(OR,li_OR2,ls_OR2)
# a um nivel de confianca de 99%
# foram encontradas evidencias de que 
# meninos e meninas sao igualmente 
# propensos a apresentar doencas
# respiratorias pois o intervalo 
# inclui o 1. 
# Logo, a chance de ter a doenca e
# a mesma entre as meninas e meninos
#############################
# RAZAO DE PREVALENCIAS EX2 #
#############################

P_F<-EX2[1,1]/sum(EX2[1,])
P_M<-EX2[2,2]/sum(EX2[2,])

RP<-P_F/P_M
f_chapeuRP<-log(RP)
Vf_chapeuRP<-P_F*(1-P_F)/(sum(EX2[1,])-1)+
  P_M*(1-P_M)/(sum(EX2[2,])-1)
alpha<-.05
z<-qnorm(1-alpha/2)
li_RP<-exp(f_chapeuRP-z*
             sqrt(Vf_chapeuRP))
ls_RP<-exp(f_chapeuRP+z*
             sqrt(Vf_chapeuRP))
cbind(RP,li_RP,ls_RP)
# a um nivel de confianca de 95%
# foram encontradas evidencias de que 
# as meninas apresentam maior
# prevalencia de doencas
# respiratorias pois nao o intervalo 
# inclui o 1. 