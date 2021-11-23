SELECT i.nome as candidato, p.id as id_processo, pa.sigla as partido from candidatos as c
  INNER JOIN individuos_pessoa_fisica as pf on c.individuo_pessoa_fisica_id = pf.id
  INNER JOIN individuos as i on i.id = pf.individuo_id
  INNER JOIN processos_judiciais as p on p.individuo_id = i.id
  INNER JOIN partidos as pa on pa.id = c.partido_id
  WHERE p.resultado = 'improcedente' OR p.data_fim > p.data_inicio + INTERVAL '5 year'
