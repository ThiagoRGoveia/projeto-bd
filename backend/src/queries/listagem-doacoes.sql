SELECT d.id AS id, i_cg.nome AS candidato, i.nome AS doador, d.valor_doado AS doacao from doacoes AS d
  INNER JOIN individuos AS i ON i.id = d.individuo_id
  INNER JOIN candidaturas AS c ON c.id = d.candidatura_id
  INNER JOIN candidatos AS cg ON c.candidato_id = cg.id
  INNER JOIN individuos_pessoa_fisica AS pf_cg ON cg.individuo_pessoa_fisica_id = pf_cg.id
  INNER JOIN individuos AS i_cg ON i_cg.id = pf_cg.individuo_id