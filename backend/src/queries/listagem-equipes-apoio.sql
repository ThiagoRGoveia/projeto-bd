SELECT ep.id AS id, i.nome AS colaborador, i_cg.nome AS candidato FROM equipes_apoio as ep
  INNER JOIN individuos_pessoa_fisica AS pf ON ep.individuo_pessoa_fisica_id = pf.id
  INNER JOIN individuos AS i ON i.id = pf.individuo_id
  INNER JOIN candidaturas AS c ON c.id = ep.candidatura_id
  INNER JOIN candidatos AS cg ON c.candidato_id = cg.id
  INNER JOIN individuos_pessoa_fisica AS pf_cg ON ep.individuo_pessoa_fisica_id = pf_cg.id
  INNER JOIN individuos AS i_cg ON i_cg.id = pf.individuo_id