CREATE OR REPLACE FUNCTION checar_ficha_limpa() RETURNS trigger AS $checar_ficha_limpa$
BEGIN
  IF EXISTS(
      SELECT 1 FROM processos_judiciais WHERE individuo_id IN (
        SELECT individuo_id FROM individuos_pessoa_fisica WHERE individuo_pessoa_fisica_id IN (
          SELECT individuo_pessoa_fisica_id FROM candidatos WHERE id = NEW.candidato_id
        )
      ) AND resultado = 'procedente' AND data_fim < data_inicio + INTERVAL '5 year'
    )
  THEN RAISE EXCEPTION 'Não é possível adicionar a candidatura, pois o candidato % possui processos com resultado "procedente".', NEW.candidato_id;
  END IF;
  RETURN NEW;
END;
$checar_ficha_limpa$ LANGUAGE plpgsql;
CREATE TRIGGER checar_ficha_limpa
BEFORE INSERT OR UPDATE ON candidaturas
FOR EACH ROW EXECUTE PROCEDURE checar_ficha_limpa();


CREATE OR REPLACE FUNCTION checar_doacao_pj() RETURNS trigger AS $checar_doacao_pj$
BEGIN
  IF EXISTS(
      SELECT 1 FROM individuos_pessoa_juridica WHERE individuo_id  = NEW.individuo_id
    ) AND EXISTS(
      SELECT 1 FROM doacoes WHERE doacoes.candidatura_id = NEW.candidatura_id AND individuo_id = NEW.individuo_id
    )
    THEN RAISE EXCEPTION 'Não é possível adicionar a doacao pois esta empresa já doou para esta campanha.';
  END IF;
  RETURN NEW;
END;
$checar_doacao_pj$ LANGUAGE plpgsql;
CREATE TRIGGER checar_doacao_pj
BEFORE INSERT OR UPDATE ON doacoes
FOR EACH ROW EXECUTE PROCEDURE checar_doacao_pj();

CREATE OR REPLACE FUNCTION checar_vice_candidato() RETURNS trigger AS $checar_vice_candidato$
BEGIN
  IF EXISTS(
      SELECT 1 FROM candidaturas where candidato_id = NEW.vice_candidato
    )
    THEN RAISE EXCEPTION 'Não é possível adicionar a doacao pois esta empresa já doou para esta campanha.';
  END IF;
  RETURN NEW;
END;
$checar_vice_candidato$ LANGUAGE plpgsql;
CREATE TRIGGER checar_vice_candidato
BEFORE INSERT ON candidaturas
FOR EACH ROW EXECUTE PROCEDURE checar_vice_candidato();


CREATE OR REPLACE FUNCTION checar_numero_eleitos() RETURNS trigger AS $checar_numero_eleitos$
BEGIN
  IF
    NEW.eleito = TRUE AND
    (
      SELECT COUNT(*) FROM candidaturas WHERE eleito = true AND cargo_id = NEW.cargo_id
    ) >= (
      SELECT vagas FROM cargos WHERE id = NEW.cargo_id
    )
    THEN RAISE EXCEPTION 'Não é possível adicionar a doacao pois esta empresa já doou para esta campanha.';
  END IF;
  RETURN NEW;
END;
$checar_numero_eleitos$ LANGUAGE plpgsql;
CREATE TRIGGER checar_numero_eleitos
BEFORE UPDATE OF eleito ON candidaturas
FOR EACH ROW EXECUTE PROCEDURE checar_numero_eleitos();

CREATE OR REPLACE FUNCTION checar_tipo_pessoa_juridica() RETURNS trigger AS $checar_tipo_pessoa_juridica$
BEGIN
	IF EXISTS (
		SELECT 1 FROM individuos_pessoa_fisica WHERE individuo_id = NEW.individuo_id
	)
	THEN RAISE EXCEPTION 'Não é possivel adicionar a pessoa juridica, pois ja tem uma pessoa fisica com o id de individuo %', NEW.individuo_id;
	END IF;
	RETURN NEW;
END;
$checar_tipo_pessoa_juridica$ LANGUAGE plpgsql;
CREATE TRIGGER checar_tipo_pessoa_juridica
BEFORE INSERT OR UPDATE ON individuos_pessoa_juridica
FOR EACH ROW EXECUTE PROCEDURE checar_tipo_pessoa_juridica();

CREATE OR REPLACE FUNCTION checar_tipo_pessoa_fisica() RETURNS trigger AS $checar_tipo_pessoa_fisica$
BEGIN
	IF EXISTS (
		SELECT 1 FROM individuos_pessoa_juridica WHERE individuo_id = NEW.individuo_id
	)
	THEN RAISE EXCEPTION 'Não é possivel adicionar a pessoa fisica, pois ja tem uma pessoa juridica com o id de individuo %', NEW.individuo_id;
	END IF;
	RETURN NEW;
END;
$checar_tipo_pessoa_fisica$ LANGUAGE plpgsql;
CREATE TRIGGER checar_tipo_pessoa_fisica
BEFORE INSERT OR UPDATE ON individuos_pessoa_fisica
FOR EACH ROW EXECUTE PROCEDURE checar_tipo_pessoa_fisica();