CREATE TABLE IF NOT EXISTS individuos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS partidos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(255) UNIQUE NOT NULL,
  sigla VARCHAR(10) UNIQUE NOT NULL,
  numero INTEGER UNIQUE NOT NULL,
  programa TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS individuos_pessoa_fisica (
  id INTEGER PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  data_nascimento DATE NOT NULL,
  individuo_id INTEGER NOT NULL,

  CONSTRAINT individuos_pessoa_fisica_individuo_id_fk
    FOREIGN KEY (individuo_id)
    REFERENCES individuos (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS candidatos (
  id INTEGER PRIMARY KEY,
  individuo_pessoa_fisica_id INTEGER NOT NULL UNIQUE,
  partido_id INTEGER NOT NULL,

  CONSTRAINT individuos_candidato_individuo_id_fk
      FOREIGN KEY (individuo_pessoa_fisica_id)
      REFERENCES individuos_pessoa_fisica (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT individuos_candidato_partido_id_fk
      FOREIGN KEY (partido_id)
      REFERENCES partidos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS cargos (
  id INTEGER PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  vagas INTEGER NOT NULL,
  cidade VARCHAR(255),
  estado VARCHAR(255),
  federacao BOOL

  CONSTRAINT local_unico
      CHECK (
        (cidade IS NOT NULL)::INTEGER +
        (estado IS NOT NULL)::INTEGER +
        (federacao = TRUE)::INTEGER = 1
      )
);
CREATE TABLE IF NOT EXISTS pleitos (
  id INTEGER PRIMARY KEY,
  ano INTEGER NOT NULL,
  tipo VARCHAR(255) NOT NULL,

  CONSTRAINT tipo_pleito_valido
      CHECK (tipo IN ('municipal', 'estadual', 'federal'))
);
CREATE TABLE IF NOT EXISTS candidaturas (
  id INTEGER PRIMARY KEY,
  candidato_id INTEGER NOT NULL,
  cargo_id INTEGER NOT NULL,
  pleito_id INTEGER NOT NULL,
  ano INTEGER NOT NULL,
  numero_votos INTEGER DEFAULT 0,
  vice_candidato INTEGER,
  eleito BOOL DEFAULT FALSE,

  CONSTRAINT candidatos_candidatura_candidato_id_fk
      FOREIGN KEY (candidato_id)
      REFERENCES candidatos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT candidatos_candidatura_cargo_id_fk
      FOREIGN KEY (cargo_id)
      REFERENCES cargos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT candidatos_candidatura_pleito_id_fk
      FOREIGN KEY (pleito_id)
      REFERENCES pleitos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT candidatura_ano
      UNIQUE (candidato_id, ano),

  CONSTRAINT vice_candidato_candidato_id_fk
      FOREIGN KEY (candidato_id)
      REFERENCES candidatos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS processos_judiciais (
  id INTEGER PRIMARY KEY,
  individuo_id INTEGER NOT NULL,
  data_inicio DATE NOT NULL,
  data_fim DATE,
  status_processo VARCHAR(255) NOT NULL,
  resultado VARCHAR(255),

  CONSTRAINT individuos_processo_judicial_individuo_id_fk
      FOREIGN KEY (individuo_id)
      REFERENCES individuos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT status_processo_valido
      CHECK (status_processo IN ('tramitação', 'julgado')),
  CONSTRAINT resultado_valido
      CHECK (resultado IN ('procedente', 'improcedente'))
);
CREATE TABLE IF NOT EXISTS equipes_apoio (
  id INTEGER PRIMARY KEY,
  individuo_pessoa_fisica_id INTEGER NOT NULL,
  candidatura_id INTEGER NOT NULL,

  CONSTRAINT candidaturas_equipe_apoio_candidato_id_fk
      FOREIGN KEY (candidatura_id)
      REFERENCES candidaturas (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT equipes_apoio_individuo_individuo_id_fk
      FOREIGN KEY (individuo_pessoa_fisica_id)
      REFERENCES individuos_pessoa_fisica (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT equipes_apoio_individuo_ano_unico
      UNIQUE (candidatura_id, individuo_pessoa_fisica_id)
);


CREATE TABLE IF NOT EXISTS doacoes (
  id INTEGER PRIMARY KEY,
  individuo_id INTEGER NOT NULL,
  candidatura_id INTEGER NOT NULL,
  valor_doado FLOAT NOT NULL,


  CONSTRAINT individuo_candidatura_doacao_individuo_id_fk
      FOREIGN KEY (individuo_id)
      REFERENCES individuos (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,

  CONSTRAINT individuos_candidatura_individuo_candidatura_id_fk
      FOREIGN KEY (candidatura_id)
      REFERENCES candidaturas (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS individuos_pessoa_juridica (
  id INTEGER PRIMARY KEY,
  cnpj VARCHAR(14) UNIQUE NOT NULL,
  individuo_id INTEGER NOT NULL,

  CONSTRAINT individuos_pessoa_juridica_individuo_id_fk
    FOREIGN KEY (individuo_id)
    REFERENCES individuos (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)

