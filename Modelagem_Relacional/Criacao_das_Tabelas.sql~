CREATE TABLE sessoes ( 
datas varchar(26 BYTE), 
publico int, 
horario varchar(5), 
id_ses int PRIMARY KEY, 
arrecadacao decimal(7,2), 
id_cin int, 
id_filme int 
); 

CREATE TABLE generos ( 
id_gen int PRIMARY KEY, 
nome_gen varchar(20) 
); 

CREATE TABLE filmes ( 
tit_port varchar(55), 
duracao int, 
id_filme int PRIMARY KEY, 
tit_orig varchar(55), 
id_pes int, 
id_gen int, 
id_pais int, 
FOREIGN KEY(id_gen) REFERENCES generos (id_gen) 
); 

CREATE TABLE estado ( 
nomem_est varchar(25), 
id_est int PRIMARY KEY, 
id_reg int 
); 

CREATE TABLE regiao ( 
nome_reg varchar(15), 
id_reg int PRIMARY KEY 
); 

CREATE TABLE cidade ( 
nome_cid varchar(20), 
id_cid int PRIMARY KEY, 
id_est int, 
FOREIGN KEY(id_est) REFERENCES estado (id_est) 
); 

CREATE TABLE cinemas ( 
capacidade int, 
id_cin int PRIMARY KEY, 
nome_cin varchar(20), 
Ender varchar(50), 
id_cid int, 
FOREIGN KEY(id_cid) REFERENCES cidade (id_cid) 
); 

CREATE TABLE pais ( 
nome_pais varchar(20), 
id_pais int PRIMARY KEY 
); 

CREATE TABLE pessoas ( 
id_pes int PRIMARY KEY, 
nome_pes varchar(50), 
id_pais int, 
FOREIGN KEY(id_pais) REFERENCES pais (id_pais) 
); 

CREATE TABLE atuar ( 
id_filme int, 
id_pes int, 
FOREIGN KEY(id_filme) REFERENCES filmes (id_filme), 
FOREIGN KEY(id_pes) REFERENCES pessoas (id_pes) 
); 

ALTER TABLE sessoes ADD FOREIGN KEY(id_cin) REFERENCES cinemas (id_cin); 
ALTER TABLE sessoes ADD FOREIGN KEY(id_filme) REFERENCES filmes (id_filme); 
ALTER TABLE filmes ADD FOREIGN KEY(id_pes) REFERENCES pessoas (id_pes); 
ALTER TABLE filmes ADD FOREIGN KEY(id_pais) REFERENCES pais (id_pais); 
ALTER TABLE estado ADD FOREIGN KEY(id_reg) REFERENCES regiao (id_reg);

6 - FORAM POPULADAS AS TABELAS COM O SEGUINTE SCRIPT :

DROP SEQUENCE seq_idreg ;
DROP SEQUENCE seq_idEst ;
DROP SEQUENCE seq_idCid ;
DROP SEQUENCE seq_pais ;
DROP SEQUENCE seq_idgen ;
DROP SEQUENCE seq_idpessoa ;
DROP SEQUENCE seq_idfil ;
DROP SEQUENCE seq_idsess ;

CREATE SEQUENCE seq_idreg NOCACHE;
CREATE SEQUENCE seq_idEst NOCACHE;
CREATE SEQUENCE seq_pais NOCACHE;
CREATE SEQUENCE seq_idgen NOCACHE;
CREATE SEQUENCE seq_idpessoa NOCACHE;
CREATE SEQUENCE seq_idcid NOCACHE;
CREATE SEQUENCE seq_idfil NOCACHE;
CREATE SEQUENCE seq_idsess NOCACHE;

CREATE OR REPLACE TRIGGER seq_idEst
BEFORE INSERT ON estado
FOR EACH ROW 
BEGIN
SELECT seq_idEst.nextval INTO :new.id_est FROM dual;
END;

CREATE or REPLACE TRIGGER seq_idreg
BEFORE INSERT ON regiao
FOR EACH ROW 
BEGIN
SELECT seq_idreg.nextval INTO :new.id_reg FROM dual;
END;

CREATE or REPLACE TRIGGER seq_id_cid
BEFORE INSERT ON cidade
FOR EACH ROW 
BEGIN
SELECT seq_idcid.nextval INTO :new.id_cid FROM dual;
END;

CREATE or REPLACE TRIGGER seq_pais
BEFORE INSERT ON pais
FOR EACH ROW 
BEGIN
SELECT seq_pais.nextval INTO :new.id_pais FROM dual;
END;

CREATE or REPLACE TRIGGER seq_id_gen
BEFORE INSERT ON generos
FOR EACH ROW 
BEGIN
SELECT seq_idgen.nextval INTO :new.id_gen FROM dual;
END;

CREATE or REPLACE TRIGGER seq_id_pessoa
BEFORE INSERT ON pessoas
FOR EACH ROW 
BEGIN
SELECT seq_idpessoa.nextval INTO :new.id_pes FROM dual;
END;



CREATE or REPLACE TRIGGER seq_id_fil
BEFORE INSERT ON filmes
FOR EACH ROW 
BEGIN
SELECT seq_idfil.nextval INTO :new.id_filme FROM dual;
END;

CREATE or REPLACE TRIGGER seq_id_sess
BEFORE INSERT ON sessoes
FOR EACH ROW 
BEGIN
SELECT seq_idsess.nextval INTO :new.id_ses FROM dual;
END;
