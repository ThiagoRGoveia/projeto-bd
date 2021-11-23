SELECT
  p.id AS id,
  i.nome AS candidato,
  p.resultado AS resultado,
  p.data_inicio AS julgamento,
  p.data_fim AS validade,
  p.status_processo AS status from processos_judiciais AS p
INNER JOIN individuos AS i on p.individuo_id = i.id