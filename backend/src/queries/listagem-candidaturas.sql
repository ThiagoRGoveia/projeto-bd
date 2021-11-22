SELECT * FROM 
		(SELECT candidatura_id,nome_cargo,ano,id
	 	FROM 
		 candidaturas as candidaturas(candidatura_id,id,cargo_id,pleito_id,ano,numero_votos,vice_candidato,eleito)
		 NATURAL JOIN
		 cargos as cargos(cargo_id,nome_cargo,vagas,cidade,estado,federacao)
		) AS F1
	NATURAL JOIN 
		 (SELECT * FROM individuos as individuos(id, Nome)) AS F2