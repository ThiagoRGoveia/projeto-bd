SELECT * from candidatos where individuo_pessoa_fisica_id NOT IN (
  SELECT id FROM individuos_pessoa_fisica WHERE individuo_id IN (
    SELECT id FROM individuos WHERE id IN (
      SELECT individuo_id FROM processos_judiciais WHERE resultado = 'procedente' AND data_fim < data_inicio + INTERVAL '5 year'
  )
))