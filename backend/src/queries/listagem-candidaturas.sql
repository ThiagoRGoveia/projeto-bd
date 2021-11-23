SELECT
	cg.id AS id_candidato,
	c.eleito AS foi_eleito,
	c.ano AS ano_eleicao,
	c.numero_votos AS votos_candidato,
	ca.nome AS cargo_candidato,
	i.nome AS nome_candidato,
	i_vice.nome AS nome_vice,
	p.sigla AS sigla_partido,
	p.numero AS numero_partido,
	COUNT(d.*) AS numero_doadores,
	SUM(d.valor_doado) AS valor_doado

FROM candidaturas AS c
  INNER JOIN candidatos AS cg ON c.candidato_id = cg.id
  INNER JOIN partidos AS p ON p.id = cg.partido_id
  INNER JOIN cargos AS ca ON ca.id = c.cargo_id
  INNER JOIN individuos_pessoa_fisica AS pf ON cg.individuo_pessoa_fisica_id = pf.id
  INNER JOIN individuos AS i ON i.id = pf.individuo_id
  LEFT JOIN candidatos AS cg_vice ON c.vice_candidato = cg_vice.id
  LEFT JOIN individuos_pessoa_fisica AS pf_vice ON cg_vice.individuo_pessoa_fisica_id = pf_vice.id
  LEFT JOIN individuos AS i_vice ON i_vice.id = pf_vice.individuo_id
  LEFT JOIN doacoes AS d ON c.id = d.candidatura_id
  GROUP BY cg.id, c.id, ca.id, i.id, i_vice.id, cg_vice.id, p.id