FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.1

MAINTAINER "Nathaniel Rudavsky-Brody <nathaniel.rudavsky@gmail.com>"

RUN bin/elasticsearch-plugin install -b ingest-attachment

RUN curl -X PUT "localhost:9200/_ingest/pipeline/attachment" -H 'Content-Type: application/json' -d '
{
  "description" : "Extract attachment information",
  "processors" : [
    {
      "attachment" : {
        "field" : "data"
      }
    }
  ]
}
'