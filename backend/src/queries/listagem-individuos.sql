WITH selection AS (
  SELECT i.*,
CASE
  WHEN cpf IS NOT NULL THEN cpf
  WHEN cnpj IS NOT NULL THEN cnpj
END AS documento,
CASE
  WHEN cpf IS NOT NULL THEN 'Pessoa Física'
  WHEN cnpj IS NOT NULL THEN 'Pessoa Jurídica'
END AS tipo
FROM individuos AS i
  LEFT JOIN individuos_pessoa_fisica AS PF ON i.id = pf.individuo_id
  LEFT JOIN individuos_pessoa_juridica AS PJ ON i.id = pj.individuo_id
)
SELECT * FROM selection

