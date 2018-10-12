# mu-elastic-search-prototype

This is a first attempt at writing an Elasticsearch component for mu.semte.ch. 

Currently there is no configuration, and many things are hard-coded.

## How to

### Setup

Clone this project, initialize the submodules.

### Boot up the system

Boot your microservices-enabled system using docker-compose.

    cd /path/to/mu-elastic-search-prototype
    docker-compose up

You can shut down using `docker-compose stop` and remove everything using `docker-compose rm`.
