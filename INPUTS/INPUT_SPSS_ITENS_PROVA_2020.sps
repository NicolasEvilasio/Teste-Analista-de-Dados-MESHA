/*****************************************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica                                          */ 
/*                                   			                                    */
/*  Coordena��o-Geral de Instrumentos e Medidas (CGIM)			*/
/*----------------------------------------------------------------------------------------------------------------------------*/
/*  PROGRAMA:                                                                                                      */
/*           INPUT_SPSS_INPUT_SAS_ITENS_PROVA_2020                                        */
/*----------------------------------------------------------------------------------------------------------------------------*/
/*DESCRICAO: PROGRAMA PARA LEITURA DA BASE DE DADOS		*/
/* ITENS_PROVA_2020		   				*/
/*****************************************************************************************************/
/*****************************************************************************************************/
/* Obs:                                                                                                                    */
/* 		                                                                                           */
/* Para abrir os microdados � necess�rio salvar este programa e o arquivo                    */
/* ITENS_PROVA_2020.csv no diret�rio C:\ do computador.		                  */
/*							 */ 
/*							 */
/* Para a leitura dos microdados � necess�rio a sele��o do programa abaixo,               */
/* depois execute-o.						 */
/*							 */ 
/******************************************************************************************************/
/*                                                   ATEN��O                                                          */ 
/******************************************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	                    */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir                */
/* os dados sem os r�tulos basta importar diretamente no SPSS.		  */
/* 							   */
/*******************************************************************************************************/


GET DATA
  /TYPE=TXT
  /FILE= "C:\ITENS_PROVA_2020.csv" /*local do arquivo*/ 
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE= ALL
  /VARIABLES=
CO_POSICAO F2.0
SG_AREA A2
CO_ITEM F6.0
TX_GABARITO A1
CO_HABILIDADE F2.0
IN_ITEM_ABAN A1	
TX_MOTIVO_ABAN A40  
NU_PARAM_A COMMA8.5		
NU_PARAM_B COMMA8.5		
NU_PARAM_C COMMA8.5		
TX_COR A7
CO_PROVA F3.0
TP_LINGUA A1       
IN_ITEM_ADAPTADO A1
TP_VERSAO_DIGITAL A1  .
CACHE.
EXECUTE.
DATASET NAME ITENS_20 WINDOW=FRONT.

VARIABLE LABELS
CO_POSICAO	Posi��o do Item na Prova
SG_AREA		�rea de Conhecimento do Item
CO_ITEM		C�digo do Item
TX_GABARITO	Gabarito do Item
CO_HABILIDADE	Habilidade do Item
IN_ITEM_ABAN	Indicador de item abandonado	
TX_MOTIVO_ABAN  	Motivo para o abandono do item
NU_PARAM_A	Par�metro de discrimina��o (a)	
NU_PARAM_B	Par�metro de dificuldade (b)	
NU_PARAM_C	Par�metro de acerto ao acaso (c)	
TX_COR		Cor da Prova
CO_PROVA	Identificador da Prova
TP_LINGUA	 	L�ngua Estrangeira
IN_ITEM_ADAPTADO	Item pertencente � prova adaptada para Ledor
TP_VERSAO_DIGITAL	Provas de LC do ENEM digital  com mesmo c�digo mas que apresentam itens ordenados de maneiras distintas conforme a op��o de l�ngua estrangeira do participante. .


VALUE LABELS
SG_AREA
		"CH"	Ci�ncias Humanas
		"CN"	Ci�ncias da Natureza
		"LC"	Linguagens e C�digos
		"MT"	Matem�tica
/TP_LINGUA
		0	Ingl�s
		1	Espanhol
/IN_ITEM_ADAPTADO
		0	N�o
		1	Sim
/IN_ITEM_ABAN
		0	N�o
		1	Sim
/TP_VERSAO_DIGITAL
		0	Ingl�s
		1	Espanhol.

