CREATE TABLE partido (
	idpartido int PRIMARY NOT NULL UNIQUE,
	nome varchar(30) NOT NULL,
	PRIMARY KEY(idpartido)
);

CREATE TABLE candidatos (
	idpartido int NOT NULL,
	cpf  varchar(30) PRIMARY NOT NULL UNIQUE,
	data_nascimento DATE NOT NULL
    /*
	CONSTRAINT fk_equipe1 FOREIGN KEY (idequipe1) REFERENCES equipes(idequipe),
	CONSTRAINT fk_equipe2 FOREIGN KEY (idequipe2) REFERENCES equipes(idequipe),
	CONSTRAINT pk_jogo PRIMARY KEY (idequipe1,idequipe2)
    */
);

CREATE TABLE candidatura (
    vaga varchar(20) NOT NULL,
    ano int NOT NULL,
    /*
	idequipe1 int NOT NULL,
	idequipe2 int NOT NULL,
	data date NOT NULL,
	gols_equipe1 int DEFAULT 0,
	gols_equipe2 int DEFAULT 0,
	local varchar(20),
	CONSTRAINT fk_equipe1 FOREIGN KEY (idequipe1, idequipe2) REFERENCES jogos(idequipe1, idequipe2),
	CONSTRAINT pk_partida PRIMARY KEY (idequipe1,idequipe2, data)
    */
);

CREATE TABLE equipes_de_apoio (
    /*
	rg varchar(30) NOT NULL UNIQUE,
	nome varchar(30) NOT NULL,
	data_nascimento date,
	naturalidade varchar(20),
	idequipe int NOT NULL,
	CONSTRAINT fk_equipe FOREIGN KEY (idequipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_jogadores PRIMARY KEY (rg,nome)
    */
);

CREATE TABLE apoiador (
	cpf varchar(30) NOT NULL,
	nome varchar(30) NOT NULL,
    data_nascimento date,
    doacao_total int NOT NULL,
    /*
	CONSTRAINT fk_jogador FOREIGN KEY (rg) REFERENCES jogadores(rg),
	CONSTRAINT pk_posicao_jogador PRIMARY KEY (rg,posicao)
    */
);

CREATE TABLE cargos (
	idReferencia int NOT NULL,
	nome varchar(20) NOT NULL,
	numero_vagas int NOT NULL,
    /*
	CONSTRAINT fk_equipe FOREIGN KEY (equipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_diretor PRIMARY KEY (equipe, nome, sobrenome)
    */
);

CREATE TABLE processo (
	terminado boolean,
	numero int,
	culpado boolean
    /*,
	CONSTRAINT fk_equipe FOREIGN KEY (equipe) REFERENCES equipes(idequipe),
	CONSTRAINT pk_uniforme PRIMARY KEY (equipe, tipo)
    */
);