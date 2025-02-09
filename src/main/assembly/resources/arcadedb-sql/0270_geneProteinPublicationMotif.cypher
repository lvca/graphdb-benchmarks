MATCH (g:Gene {iri:'$iri'})-[:enc]->(p:Protein)
WITH g,p
CALL {
	MATCH (p)-[:genetic*0..6] -> (p2:Protein)
	RETURN DISTINCT p2 
		UNION 
	MATCH (p)-[:physical*0..6] -> (p2:Protein) 
	RETURN DISTINCT p2
		UNION
	MATCH (p)-[:h_s_s*0..4] -> (p2:Protein)
	RETURN DISTINCT p2
		UNION
	MATCH (p)-[:ortho*0..4]-> (p2:Protein) 
	RETURN DISTINCT p2
		UNION 
	MATCH (p)-[:xref*0..4]->(p2:Protein)
	RETURN DISTINCT p2
	}
MATCH(p2)-[:pub_in]->(pub:Publication)
RETURN g.prefName, pub.prefName LIMIT 100