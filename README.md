# mu-elastic-search-prototype

This is an environment for testing the first attempt at writing an Elasticsearch component for mu.semte.ch (https://github.com/nathanielrb/mu-elastic-search).

It uses the mu-query-rewriter authorization component, with the plugin found in `./config/rewriter/elastic-prototype.scm`.

Simple tests can be found and run in `./mu-elastic-search/testing/basic-tests.rb`.

## How to

### Setup

Clone this project, initialize the submodules.

### Boot up the system

Boot your microservices-enabled system using docker-compose.

    cd /path/to/mu-elastic-search-prototype
    docker-compose up

You can shut down using `docker-compose stop` and remove everything using `docker-compose rm`.

## Memory Usage

For elasticsearch to run, you need to give it enough memory. Quick fix (temp):

    sudo sysctl -w vm.max_map_count=262144
