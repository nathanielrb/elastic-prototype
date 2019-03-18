(*functional-properties* '())

(*transient-functional-properties* '())

(*query-functional-properties?* #f)

(*queried-properties* '())

(*transient-queried-properties* '())

(*unique-variables* '())

(*headers-replacements* '(("<SESSION>" mu-session-id uri)))

(define-constraint  
  'read/write " 
CONSTRUCT {
  ?a ?b ?c
}
WHERE {
   GRAPH <http://mu.semte.ch/application> {
   ?a rdf:type ex:Document;
      muAuth:inGroup ?group
      FILTER (?group22536 IN (<group1>))
  }

}")

