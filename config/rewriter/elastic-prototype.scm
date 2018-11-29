(*functional-properties* '()) ;'(rdf:type))

(*calculate-annotations?* #t) (*query-annotations?* #t)

;; (*unique-variables* '(?user ?role))

;; (*query-functional-properties?* #t)

;; (*queried-properties* '())

;; (*headers-replacements* '(("<ALLOWED_GROUPS>" MU_ALLOWED_GROUPS uri)))

(define-constraint  
  'read/write
  (lambda ()
    (let ((groups (map (cut alist-ref 'value <>)
                       (vector->list
                        (read-json
                         (header-value 'mu_auth_allowed_groups
                                       (*request-headers*)))))))
    
      (conc "PREFIX foaf: <http://xmlns.com/foaf/0.1/>"
            "PREFIX mu: <http://mu.semte.ch/vocabularies/core/>"
            "PREFIX muAuth: <http://mu.semte.ch/vocabularies/authorization/>"
            "PREFIX ex: <http://example.org/>"
            "PREFIX dct: <http://purl.org/dc/terms/>"
            ""
            "CONSTRUCT {"
            " ?a ?b ?c."
            "}"
            "WHERE {"
            " GRAPH <http://mu.semte.ch/application> { "
            "  ?a a ex:Document;"
            "     ?b ?c "
            (if (member "admin" groups) ""
                (conc "; muAuth:inGroup ?group "
                      "FILTER (?group IN (" 
                      (string-join 
                       (map (cut format "~A" <>) groups)
                       ",")
                      "))"))
            " @access group(?group) "
            " } "
            "}"))))
