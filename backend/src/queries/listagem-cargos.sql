WITH selection AS (
  SELECT cargos.*,
  CASE
    WHEN cidade IS NOT NULL THEN cidade
    WHEN estado IS NOT NULL THEN estado
    WHEN federacao = TRUE THEN 'Federação'
    END AS local
  FROM cargos
)
SELECT * FROM selection
