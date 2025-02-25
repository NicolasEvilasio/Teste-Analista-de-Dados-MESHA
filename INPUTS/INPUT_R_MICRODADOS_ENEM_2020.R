#--------------------------------------------------------
#  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica 
#  Coordena��o-Geral de Instrumentos e Medidas (CGIM)			
#--------------------------------------------------------

#--------------------------------------------------------
#  PROGRAMA:                                                                                                      
#           INPUT_R_MICRODADOS_ENEM_2020
#--------------------------------------------------------
#  DESCRI��O:
#           PROGRAMA PARA LEITURA DA BASE DE DADOS
#           MICRODADOS_ENEM_2020
#--------------------------------------------------------

#------------------------------------------------------------------------
# Obs:                                                                                                                    
#     Para abrir os microdados � necess�rio salvar este programa e o arquivo                    
#     MICRODADOS_ENEM_2020.csv no mesmo diret�rio.	                  
#------------------------------------------------------------------------

#------------------------------------------------------------------------
#                   ATEN��O              
#------------------------------------------------------------------------
# Este programa abre a base de dados com os r�tulos das vari�veis de	                    
# acordo com o dicion�rio de dados que comp�em os microdados. 		  
#------------------------------------------------------------------------

#--------------------
# Intala��o do pacote Data.Table
# Se n�o estiver instalado
#--------------------
if(!require(data.table)){install.packages('data.table')}

#--------------------
# Caso deseje trocar o local do arquivo, 
# edit a fun��o setwd() a seguir informando o local do arquivo.
# Ex. Windows setwd("C:/temp")
#     Linux   setwd("/home")
#--------------------
setwd("C:/")  

#---------------
# Aloca��o de mem�ria
#---------------
memory.limit(24576)

#------------------
# Carga dos microdados

ENEM_2020 <- data.table::fread(input='microdados_ENEM_2020.csv',
                               integer64='character',
                               skip=0,  #Ler do inicio
                               nrow=-1, #Ler todos os registros
                               na.strings = "", 
                               showProgress = TRUE)

#---------------------------
# A script a seguir formata os r�tulos das respostas
# Para formatar um item retire o caracter de coment�rio (#) no in�cio na linha desejada 
#---------------------------

#ENEM_2020$TP_FAIXA_ETARIA <- factor(ENEM_2020$TP_FAIXA_ETARIA, 
#                                    levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
#                                    labels = c('Menor de 17 anos','17 anos','18 anos','19 anos','20 anos','21 anos','22 anos',
#                                               '23 anos','24 anos','25 anos','Entre 26 e 30 anos','Entre 31 e 35 anos','Entre 36 e 40 anos',
#                                               'Entre 41 e 45 anos','Entre 46 e 50 anos','Entre 51 e 55 anos','Entre 56 e 60 anos','Entre 61 e 65 anos',
#                                               'Entre 66 e 70 anos','Maior de 70 anos'))

#ENEM_2020$IN_TREINEIRO <- factor(ENEM_2020$IN_TREINEIRO, levels = c(1,0),  labels=c('Sim','N�o'))

#ENEM_2020$TP_DEPENDENCIA_ADM_ESC <- factor(ENEM_2020$TP_DEPENDENCIA_ADM_ESC, levels = c(1,2,3,4),
#                                           labels=c('Federal',
#                                                    'Estadual',
#                                                    'Municipal',
#                                                    'Privada'))

#ENEM_2020$TP_LOCALIZACAO_ESC <- factor(ENEM_2020$TP_LOCALIZACAO_ESC, levels = c(1,2), labels=c('Urbana','Rural'))

#ENEM_2020$TP_SIT_FUNC_ESC <- factor(ENEM_2020$TP_SIT_FUNC_ESC, levels = c(1,2,3,4),
#                                    labels=c('Em atividade',
#                                             'Paralisada',
#                                             'Extinta',
#                                             'Escola extinta em anos anteriores'))

#ENEM_2020$TP_SEXO <- factor(ENEM_2020$TP_SEXO, levels = c('M','F'), labels=c('Maculino','Feminino'))

#ENEM_2020$TP_ESTADO_CIVIL <- factor(ENEM_2020$TP_ESTADO_CIVIL, levels = c(0,1,2,3,4),
#                                    labels=c('N�o informado',
#                                             'Solteiro(a)',
#                                             'Casado(a)/Mora com um(a) companheiro(a)',
#                                             'Divorciado(a)/Desquitado(a)/Separado(a)',
#                                             'Vi�vo(a)'))

#ENEM_2020$TP_COR_RACA <- factor(ENEM_2020$TP_COR_RACA, levels = c(0,1,2,3,4,5,6),
#                                labels=c('N�o declarado',
#                                         'Branca','Preta',
#                                         'Parda','Amarela',
#                                         'Ind�gena',
#                                         'N�o disp�e da informa��o'))

#ENEM_2020$TP_NACIONALIDADE <- factor(ENEM_2020$TP_NACIONALIDADE, levels = c(0,1,2,3,4),
#                                     labels=c('N�o informado',
#                                              'Brasileiro(a)',
#                                              'Brasileiro(a) Naturalizado(a)',
#                                              'Estrangeiro(a)',
#                                              'Brasileiro(a) Nato(a), nascido(a) no exterior'))

#ENEM_2020$TP_ST_CONCLUSAO <- factor(ENEM_2020$TP_ST_CONCLUSAO, levels = c(1,2,3,4), 
#                                    labels=c('J� conclu� o Ensino M�dio',
#                                             'Estou cursando e concluirei o Ensino M�dio em 2020',
#                                             'Estou cursando e concluirei o Ensino M�dio ap�s 2020',
#                                             'N�o conclu� e n�o estou cursando o Ensino M�dio'))

#ENEM_2020$TP_ANO_CONCLUIU <- factor(ENEM_2020$TP_ANO_CONCLUIU, levels = c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14),
#                                    labels=c('N�o informado','2019','2018','2017','2016',
#                                             '2015','2014','2013',
#                                             '2012','2011','2010',
#                                             '2009','2008','2007',
#                                             'Anterior a 2007'))

#ENEM_2020$TP_ESCOLA <- factor(ENEM_2020$TP_ESCOLA, levels = c(1,2,3,4),
#                              labels=c('N�o respondeu',
#                                       'P�blica',
#                                       'Privada',
#                                       'Exterior'))

#ENEM_2020$TP_ENSINO <- factor(ENEM_2020$TP_ENSINO, levels = c(1,2,3),
#                              labels=c('Ensino Regular',
#                                       'Educa��o Especial - Modalidade Substitutiva',
#                                       'Educa��o de Jovens e Adultos'))



#ENEM_2020$TP_PRESENCA_CN <- factor(ENEM_2020$TP_PRESENCA_CN, levels = c(0,1,2),
#                                    labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2020$TP_PRESENCA_CH <- factor(ENEM_2020$TP_PRESENCA_CH, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2020$TP_PRESENCA_LC <- factor(ENEM_2020$TP_PRESENCA_LC, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2020$TP_PRESENCA_MT <- factor(ENEM_2020$TP_PRESENCA_MT, levels = c(0,1,2),
#                                   labels=c('Faltou � prova',
#                                            'Presente na prova',
#                                            'Eliminado na prova'))

#ENEM_2020$CO_PROVA_CN <- factor(ENEM_2020$CO_PROVA_CN, levels = c(597,598,599,600,601,602,604,605,677,678,679,680,684,699,700,701,702),
#                                labels=c('Azul','Amarela','Cinza','Rosa','Rosa - Ampliada',
#                                       'Rosa - Superampliada','Laranja - Adaptada Ledor',
#                                       'Verde - Videoprova - Libras','Azul (Reaplica��o)',
#                                       'Amarela (Reaplica��o)','Cinza (Reaplica��o)',
#                                       'Rosa (Reaplica��o)','Laranja - Adaptada Ledor (Reaplica��o)',
#                                       'Azul (Digital)','Amarela (Digital)','Rosa (Digital)','Cinza (Digital)'))

#ENEM_2020$CO_PROVA_CH <- factor(ENEM_2020$CO_PROVA_CH, levels = c(567,568,569,570,571,572,574,575,647,648,649,650,654,687,688,689,690),
#                                labels=c('Azul','Amarela','Branca','Rosa','Rosa - Ampliada',
#                                       'Rosa - Superampliada','Laranja - Adaptada Ledor',
#                                       'Verde - Videoprova - Libras','Azul (Reaplica��o)',
#                                       'Amarela (Reaplica��o)','Branca (Reaplica��o)',
#                                       'Rosa (Reaplica��o)','Laranja - Adaptada Ledor (Reaplica��o)',
#                                       'Azul (Digital)','Amarela (Digital)','Branca (Digital)','Rosa (Digital)'))

#ENEM_2020$CO_PROVA_LC <- factor(ENEM_2020$CO_PROVA_LC, levels = c(577,578,579,580,581,582,584,585,657,658,659,660,664,691,692,693,694),
#                                labels=c('Azul','Amarela','Rosa','Branca','Rosa - Ampliada',
#                                       'Rosa - Superampliada','Laranja - Adaptada Ledor',
#                                       'Verde - Videoprova - Libras','Azul (Reaplica��o)',
#                                       'Amarela (Reaplica��o)','Rosa (Reaplica��o)',
#                                       'Branca (Reaplica��o)','Laranja - Adaptada Ledor (Reaplica��o)',
#                                       'Azul (Digital)','Amarela (Digital)','Branca (Digital)','Rosa (Digital)'))

#ENEM_2020$CO_PROVA_MT <- factor(ENEM_2020$CO_PROVA_MT, levels = c(587,588,589,590,591,592,594,595,667,668,669,670,674,695,696,697,698),
#                                 labels=c('Azul','Amarela','Rosa','Cinza','Rosa - Ampliada',
#                                       'Rosa - Superampliada','Laranja - Adaptada Ledor',
#                                       'Verde - Videoprova - Libras','Azul (Reaplica��o)',
#                                       'Amarela (Reaplica��o)','Rosa (Reaplica��o)','Cinza (Reaplica��o)',
#                                       'Laranja - Adaptada Ledor (Reaplica��o)','Azul (Digital)',
#                                       'Amarela (Digital)','Rosa (Digital)','Cinza (Digital)'))

#ENEM_2020$ TP_LINGUA <- factor(ENEM_2020$ TP_LINGUA, levels = c(0,1),
#                                labels=c('Ingl�s','Espanhol'))

#ENEM_2020$TP_STATUS_REDACAO <- factor(ENEM_2020$TP_STATUS_REDACAO, levels = c(1,2,3,4,5,6,7,8,9),
#                                      labels=c('Sem problemas',
#                                               'Anulada','C�pia Texto Motivador',
#                                               'Em Branco','Fere Direitos Humanos',
#                                               'Fuga ao tema',
#                                               'N�o atendimento ao tipo',
#                                               'Texto insuficiente',
#                                               'Parte desconectada'))

#ENEM_2020$Q001 <- factor(ENEM_2020$Q001, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'N�o completou a 4� s�rie/5� ano do ensino fundamental',
#                                  'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do ensino fundamental',
#                                  'Completou a 8� s�rie/9� ano do ensino fundamental, mas n�o completou o Ensino M�dio',
#                                  'Completou o Ensino M�dio, mas n�o completou a Faculdade',
#                                  'Completou a Faculdade, mas n�o completou a P�s-gradua��o',
#                                  'Completou a P�s-gradua��o','N�o sei'))

#ENEM_2020$Q002 <- factor(ENEM_2020$Q002, levels = c('A','B','C','D','E','F','G','H'),
#                         labels=c('Nunca estudou',
#                                  'N�o completou a 4� s�rie/5� ano do ensino fundamental',
#                                  'Completou a 4� s�rie/5� ano, mas n�o completou a 8� s�rie/9� ano do ensino fundamental',
#                                  'Completou a 8� s�rie/9� ano do ensino fundamental, mas n�o completou o Ensino M�dio',
#                                  'Completou o Ensino M�dio, mas n�o completou a Faculdade',
#                                  'Completou a Faculdade, mas n�o completou a P�s-gradua��o',
#                                  'Completou a P�s-gradua��o','N�o sei'))

#ENEM_2020$Q003 <- factor(ENEM_2020$Q003, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 2 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 3 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 4 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 5 (Verificar a defini��o no dicion�rio de dados)',
#                                  'N�o Sei'))

#ENEM_2020$Q004 <- factor(ENEM_2020$Q004, levels =  c('A','B','C','D','E','F'),
#                         labels=c('Grupo 1 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 2 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 3 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 4 (Verificar a defini��o no dicion�rio de dados)',
#                                  'Grupo 5 (Verificar a defini��o no dicion�rio de dados)',
#                                  'N�o Sei'))

#ENEM_2020$Q005 <- factor(ENEM_2020$Q005, levels = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20), 
#                         labels=c('1','2','3','4','5','6','7','8','9','10',
#                                  '11','12','13','14','15','16','17','18','19','20'))

#ENEM_2020$Q006 <- factor(ENEM_2020$Q006,levels =  c('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q'),
#                         labels=c('Nenhuma renda.',
#                                  'At� R$ 1.045,00',
#                                  'De R$ 1.045,01 at� R$ 1.567,50',
#                                  'De R$ 1.567,51 at� R$ 2.090,00',
#                                  'De R$ 2.090,01 at� R$ 2.612,50',
#                                  'De R$ 2.612,51 at� R$ 3.135,00',
#                                  'De R$ 3.135,01 at� R$ 4.180,00',
#                                  'De R$ 4.180,01 at� R$ 5.225,00',
#                                  'De R$ 5.225,01 at� R$ 6.270,00',
#                                  'De R$ 6.270,01 at� R$ 7.315,00',
#                                  'De R$ 7.315,01 at� R$ 8.360,00',
#                                  'De R$ 8.360,01 at� R$ 9.405,00',
#                                  'De R$ 9.405,01 at� R$ 10.450,00',
#                                  'De R$ 10.450,01 at� R$ 12.540,00',
#                                  'De R$ 12.540,01 at� R$ 15.675,00',
#                                  'De R$ 15.675,01 at� R$ 20.900,00',
#                                  'Acima de R$ 20.900,00'))

#ENEM_2020$Q007 <- factor(ENEM_2020$Q007, levels = c('A','B','C','D'),
#                         labels=c('N�o','Sim, um ou dois dias por semana',
#                                  'Sim, tr�s ou quatro dias por semana',
#                                  'Sim, pelo menos cinco dias por semana'))

#ENEM_2020$Q008 <- factor(ENEM_2020$Q008, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q009 <- factor(ENEM_2020$Q009, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))


#ENEM_2020$Q010 <- factor(ENEM_2020$Q010, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q011 <- factor(ENEM_2020$Q011, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q012 <- factor(ENEM_2020$Q012, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q013 <- factor(ENEM_2020$Q013, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q014 <- factor(ENEM_2020$Q014, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q015 <- factor(ENEM_2020$Q015, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q016 <- factor(ENEM_2020$Q016, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q017 <- factor(ENEM_2020$Q017, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q018 <- factor(ENEM_2020$Q018, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2020$Q019 <- factor(ENEM_2020$Q019, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q020 <- factor(ENEM_2020$Q020, levels = c('A','B'), labels=c('N�o','Sim'))
#ENEM_2020$Q021 <- factor(ENEM_2020$Q021, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2020$Q022 <- factor(ENEM_2020$Q022, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q023 <- factor(ENEM_2020$Q023, levels = c('A','B'), labels=c('N�o','Sim'))

#ENEM_2020$Q024 <- factor(ENEM_2020$Q024, levels = c('A','B','C','D','E'),
#                         labels=c('N�o',
#                                  'Sim, um',
#                                  'Sim, dois',
#                                  'Sim, tr�s',
#                                  'Sim, quatro ou mais'))

#ENEM_2020$Q025 <- factor(ENEM_2020$Q025, levels = c('A','B'), labels=c('N�o','Sim'))
