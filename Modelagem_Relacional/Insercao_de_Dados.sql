INSERT INTO regiao (nome_reg) 
SELECT DISTINCT região
FROM salas_de_cinema;

INSERT INTO pais (nome_pais) 
SELECT DISTINCT origem
FROM Catalogo_de_Filmes;

INSERT INTO generos (nome_gen) 
SELECT DISTINCT genero
FROM catalogo_de_filmes;

INSERT INTO estado (nomem_est,id_reg)
SELECT DISTINCT salas_de_cinema.estado,regiao.id_reg
FROM salas_de_cinema JOIN regiao ON regiao.nome_reg=salas_de_cinema.regiao;

INSERT INTO cidade (nome_cid,id_est)
SELECT DISTINCT salas_de_cinema.cidade,estado.id_est
FROM salas_de_cinema JOIN estado ON estado.nomem_est=salas_de_cinema.estado;

INSERT INTO cinemas(id_cin,capacidade,nome_cin,id_cid)
SELECT DISTINCT id_cinema,lotacao,cinema,id_cid FROM salas_de_cinema JOIN cidade ON cidade.nome_cid=salas_de_cinema .cidade;

INSERT INTO pessoas (nome_pes)
SELECT DISTINCT diretor  from Catalogo_de_Filmes WHERE DIRETOR IS NOT NULL UNION
SELECT DISTINCT ATOR_PRINCIPAL from Catalogo_de_Filmes WHERE ATOR_PRINCIPAL IS NOT NULL UNION
SELECT DISTINCT ATOR_2 from Catalogo_de_Filmes WHERE ATOR_2 IS NOT NULL UNION
SELECT DISTINCT ATOR_3 from Catalogo_de_Filmes WHERE ATOR_3 IS NOT NULL;

INSERT INTO filmes(tit_port,duracao,tit_orig,id_pes,id_gen,id_pais)
SELECT DISTINCT tit_portugues,duracao,tit_original,id_pes,generos.id_gen,pais.id_pais FROM Catalogo_de_Filmes JOIN
pessoas ON pessoas.nome_pes=Catalogo_de_Filmes.diretor JOIN generos ON generos.nome_gen=Catalogo_de_Filmes.genero
JOIN pais ON pais.nome_pais=Catalogo_de_Filmes.origem;

INSERT INTO atuar(id_filme,id_pes)
SELECT DISTINCT filmes.id_filme,pessoas.id_pes from pessoas join Catalogo_de_Filmes on pessoas.nome_pes=Catalogo_de_Filmes.ator_principal or pessoas.nome_pes =Catalogo_de_Filmes.ator_2
or pessoas.nome_pes =Catalogo_de_Filmes.ator_3 join filmes on filmes.tit_orig=Catalogo_de_Filmes.tit_original;

INSERT INTO sessoes (datas,publico,horario,arrecadacao,id_cin,id_filme)
SELECT DISTINCT datas,Sessoes_de_Filmes.publico,horario,arrecadacao,cinemas.id_cin,filmes.id_filme FROM Sessoes_de_Filmes JOIN filmes ON filmes.tit_port=sessoes_de_filmes.tit_portugues
JOIN cinemas ON cinemas.nome_cin=sessoes_de_filmes.nome_cinema;

