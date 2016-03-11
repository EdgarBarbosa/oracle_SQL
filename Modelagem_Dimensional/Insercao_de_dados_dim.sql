INSERT INTO TCINEMA(ESTADO,CIDADE,NOME_CIN,ID_CIN)
select distinct estado.NOMEM_EST,cidade.NOME_CID,NOME_CIN,ID_CIN from cinemas join cidade on cinemas.ID_CID=cidade.ID_CID
join estado on cidade.ID_EST=estado.ID_EST;

INSERT INTO TFILMES (ID_FILME,TIT_PORT)
SELECT FILMES.ID_FILME,FILMES.TIT_PORT FROM FILMES;

INSERT INTO TGENEROS (NOME_GEN,ID_GEN)
SELECT GENEROS.NOME_GEN,GENEROS.ID_GEN FROM GENEROS;

INSERT INTO TPESSOAS(NOME_PES,ID_PES)
SELECT DISTINCT PESSOAS.NOME_PES,PESSOAS.ID_PES FROM PESSOAS JOIN FILMES ON FILMES.ID_PES=PESSOAS.ID_PES;

INSERT INTO TDATAS(MES,DATAS)
SELECT DISTINCT TO_CHAR(TO_DATE(DATAS,'MM/DD/YYYY'),'MONTH'),DATAS FROM SESSOES ;

INSERT INTO TSESSOES(ID_SES,PUBLICO,ARRECADACAO,ID_DATA,ID_CIN,ID_PES,ID_GEN,ID_FILME)
SELECT DISTINCT  ID_SES,PUBLICO,ARRECADACAO,TDATAS.ID_DATA,SESSOES.ID_CIN,FILMES.ID_PES,FILMES.ID_GEN,SESSOES.ID_FILME  FROM SESSOES 
JOIN TDATAS ON TDATAS.DATAS=SESSOES.DATAS
JOIN FILMES ON FILMES.ID_FILME=SESSOES.ID_FILME;

