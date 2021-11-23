SELECT * FROM
	individuos
	NATURAL JOIN
	(SELECT * FROM 
		(SELECT * FROM 
			(SELECT id FROM candidaturas as candidaturas(candidatura_id, candidato_id,cargo_id,pleito_id,ano,numero_votos,id,eleito)WHERE eleito = TRUE) AS F1
			NATURAL JOIN
			candidatos as candidatos (id , individuo_pessoa_fisica_id, partido_id)
		)AS F2

		UNION SELECT * FROM
		(SELECT * FROM 
				(SELECT id FROM candidaturas as candidaturas(candidatura_id, id,cargo_id,pleito_id,ano,numero_votos,vice_candidato,eleito) WHERE eleito = TRUE) AS F4
				 NATURAL JOIN
				 candidatos as candidatos(id , individuo_pessoa_fisica_id, partido_id)
		) AS F4
	) AS F5
			 