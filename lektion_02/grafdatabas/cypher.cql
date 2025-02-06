// Add an Actor node
MERGE (a:Actor {actor_name: "Carrie-Anne Moss"})

// Add relationships
MATCH (a:Actor {actor_name: "Carrie-Anne Moss"})
MATCH (m:Movie) WHERE m.movie_title CONTAINS "Matrix"
MERGE (a)-[:ACTED_IN]->(m)

// Show relationships
MATCH path=(a:Actor {actor_name: "Carrie-Anne Moss"})-[:ACTED_IN]->(m: Movie) WHERE m.movie_title CONTAINS "Matrix"
RETURN path