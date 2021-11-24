WITH selection AS (
  SELECT
    c.id AS id,
    i.nome AS candidato_nome,
    c.vice_candidato AS vice_nome,
    c.numero_votos AS votos_candidato,
    p.ano AS eleicao FROM candidaturas AS c
  INNER JOIN candidatos AS cg ON c.candidato_id = cg.id
  INNER JOIN individuos_pessoa_fisica AS pf ON cg.individuo_pessoa_fisica_id = pf.id
  INNER JOIN individuos AS i ON i.id = pf.individuo_id
  INNER JOIN pleitos AS p ON p.id = c.pleito_id
  LEFT JOIN candidatos AS cg_vice ON c.vice_candidato = cg_vice.id
  LEFT JOIN individuos_pessoa_fisica AS pf_vice ON cg_vice.individuo_pessoa_fisica_id = pf_vice.id
  LEFT JOIN individuos AS i_vice ON i_vice.id = pf_vice.individuo_id
  WHERE eleito = TRUE
)
SELECT * FROM selection

