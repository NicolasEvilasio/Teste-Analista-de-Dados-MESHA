/**************************************************************************/
/*  INEP/Daeb-Diretoria de Avalia��o da Educa��o B�sica              	  */      
/*                                   									  */	
/*  Coordena��o-Geral de Instrumentos e Medidas (CGIM)					  */
/*------------------------------------------------------------------------*/
/*  PROGRAMA:                                                             */
/*           INPUT_SAS_ITENS_PROVA_2020.sas	                        	  */
/*------------------------------------------------------------------------*/
/*  DESCRICAO: PROGRAMA PARA LEITURA DOS ITENS DAS PROVAS DO ENEM DE 2020 */    
/*                                                                        */
/**************************************************************************/
/**************************************************************************/
/* Obs:                                                                   */
/* 		                                                                  */
/* Para abrir os microdados � necess�rio salvar este programa e o arquivo */
/* ITENS_PROVA_2020.CSV no diret�rio C:\ do computador.				      */
/*															 			  */                                           
/* Ao terminar esses procedimentos execute o programa salvo utilizando    */
/* as vari�veis de interesse.                                             */
/**************************************************************************/
/*				                  ATEN��O                                 */  
/**************************************************************************/
/* Este programa abre a base de dados com os r�tulos das vari�veis de	  */
/* acordo com o dicion�rio de dados que comp�em os microdados. Para abrir */
/* os dados sem os r�tulos basta importar diretamente no SAS.			  */
/* 																	      */ 																          
/**************************************************************************/

proc format;
Value $SG_AREA
		CH='Ci�ncias Humanas'
		CN='Ci�ncias da Natureza'
		LC='Linguagens e C�digos'
		MT='Matem�tica';

Value $TP_LINGUA
		0='Ingl�s'
		1='Espanhol';

Value $IN_ITEM_ADAPTADO
		0='N�o'
		1='Sim';

Value $TP_VERSAO_DIGITAL
		0='Ingl�s'
		1='Espanhol';

Value $IN_ITEM_ABAN
		0='N�o'
		1='Sim';


DATA WORK.ITENS_2020;
INFILE 'C:\ITENS_PROVA_2020.csv' /*local do arquivo*/
        LRECL=100
        FIRSTOBS=2
        DLM=';'
        MISSOVER
        DSD ;

INPUT
        CO_POSICAO       	: BEST2.
        SG_AREA          	: $CHAR2.
        CO_ITEM          	: BEST6.
        TX_GABARITO      	: $CHAR1.
        CO_HABILIDADE    	: BEST2.
		IN_ITEM_ABAN		: $CHAR1.
		TX_MOTIVO_ABAN      : $CHAR40.
		NU_PARAM_A			: BEST8.
		NU_PARAM_B			: BEST8.
		NU_PARAM_C			: BEST8.
        TX_COR           	: $CHAR7.
        CO_PROVA         	: BEST3.
        TP_LINGUA        	: $CHAR1.
        IN_ITEM_ADAPTADO 	: $CHAR1. 
		TP_VERSAO_DIGITAL	: $CHAR1.;

ATTRIB  SG_AREA          	FORMAT = $SG_AREA20.;         
ATTRIB  TP_LINGUA        	FORMAT = $TP_LINGUA8.;       
ATTRIB  IN_ITEM_ADAPTADO 	FORMAT = $IN_ITEM_ADAPTADO3.;
ATTRIB  TP_VERSAO_DIGITAL	FORMAT = $TP_VERSAO_DIGITAL8.;
ATTRIB  IN_ITEM_ABAN		FORMAT = $IN_ITEM_ABAN.;

LABEL
CO_POSICAO='Posi��o do Item na Prova'
SG_AREA='�rea de Conhecimento do Item'
CO_ITEM='C�digo do Item'
TX_GABARITO='Gabarito do Item'
CO_HABILIDADE='Habilidade do Item'
IN_ITEM_ABAN='Indicador de item abandonado'	
TX_MOTIVO_ABAN='Motivo para o abandono do item'  
NU_PARAM_A='Par�metro de discrimina��o (a)'		
NU_PARAM_B='Par�metro de dificuldade (b)'		
NU_PARAM_C='Par�metro de acerto ao acaso (c)'		
TX_COR='Cor da Prova'
CO_PROVA='Identificador da Prova'
TP_LINGUA='L�ngua Estrangeira '
IN_ITEM_ADAPTADO='Item pertencente � prova adaptada para Ledor'
TP_VERSAO_DIGITAL='Provas de LC do ENEM digital com mesmo c�digo mas que apresentam itens ordenados de maneiras distintas conforme a op��o de l�ngua estrangeira do participante';

RUN;