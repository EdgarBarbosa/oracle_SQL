CREATE TABLE Tdatas (
id_data int PRIMARY KEY,
datas varchar(15),
mes varchar(20)
);

CREATE TABLE Tcinema (
estado varchar(20),
cidade varchar(20),
nome_cin varchar(50),
id_cin int PRIMARY KEY,
);

CREATE TABLE Tpessoas (
nome_pes varchar(55),
id_pes int PRIMARY KEY
);

CREATE TABLE Tgeneros (
nome_gen varchar(20),
id_gen int PRIMARY KEY
);

CREATE TABLE Tfilmes (
id_filme int PRIMARY KEY,
tit_port VARCHAR(55)
);

CREATE TABLE Tsessoes (
id_ses int PRIMARY KEY,
publico varchar(10),
arrecadacao varchar(20),
id_data int,
id_cin int,
id_pes int,
id_gen int,
id_filme int,
FOREIGN KEY(id_data) REFERENCES TDATAS (id_data),
FOREIGN KEY(id_cin) REFERENCES Tcinema (id_cin),
FOREIGN KEY(id_pes) REFERENCES Tpessoas (id_pes),
FOREIGN KEY(id_gen) REFERENCES Tgeneros (id_gen),
FOREIGN KEY(id_filme) REFERENCES Tfilmes (id_filme)
);


CREATE SEQUENCE SEQ_IDDATAS NOCACHE;

CREATE OR REPLACE TRIGGER GERA_ID_DATA
BEFORE INSERT ON TDATAS
FOR EACH ROW
BEGIN
SELECT SEQ_IDDATAS.NEXTVAL INTO:NEW.ID_DATA FROM DUAL; 
END;
