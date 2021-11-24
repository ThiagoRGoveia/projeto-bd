WITH selection AS (
    SELECT i.id AS id, i.nome AS candidato, p.id AS id_processo, pa.sigla AS partido from candidatos AS c
      INNER JOIN individuos_pessoa_fisica AS pf on c.individuo_pessoa_fisica_id = pf.id
      INNER JOIN individuos AS i on i.id = pf.individuo_id
      INNER JOIN processos_judiciais AS p on p.individuo_id = i.id
      INNER JOIN partidos AS pa on pa.id = c.partido_id
      WHERE p.resultado = 'improcedente' OR p.data_fim > p.data_inicio + INTERVAL '5 year'
)
SELECT * FROM selection
