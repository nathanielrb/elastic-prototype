# elastic-prototype


This is a sandbox for testing [mu-elastic-search](https://github.com/nathanielrb/mu-elastic-search), the Elasticsearch component for mu.semte.ch. 

It is configured *without* deltas or authorization. 

(Testing for deltas and authorization have been done using the mu-query-rewriter authorization component, with the plugin found in `./config/rewriter/elastic-prototype.scm`. This is now disconnected, and does not reflect the current model.)

## How to

### Setup

Clone this project, initialize the submodules.

### Memory usage

For elasticsearch to run, you need to give it enough memory. Quick local fix:

    sudo sysctl -w vm.max_map_count=262144

### Boot up the system

Boot your microservices-enabled system using docker-compose.

    cd /path/to/elastic-prototype
    docker-compose up

### Load Sample Data

Load the sample data in `./data/example.ttl` into the graph `<http://mu.semte.ch/flemishGovernment>`. (This data is taken from <https://github.com/kanselarij-vlaanderen/kaleidos-project/blob/master/data/example.ttl>, with minor additions in text fields.)

### Send Queries

Query the pre-built index:

```
curl -H "MU_AUTH_ALLOWED_GROUPS: [{\"value\" : \"group1\"}]" \
     http://localhost:8888/documents/search?filter\\[title\\]=fish
```

Query a new index:

```
curl -H "MU_AUTH_ALLOWED_GROUPS: [{\"value\" : \"group2\"}]" \
      http://localhost:8888/documents/search?filter\\[title\\]=fish
```

Rebuild an index:

```
curl -X POST -H "MU_AUTH_ALLOWED_GROUPS: [{\"value\" : \"group2\"}]" \
     http://localhost:8888/documents/index
```
**Note** that the `MU_AUTH_ALLOWED_GROUPS` header is required even though this is not taken into account when an authorization service is not in place. Queries sent without this header are currently considered 'admin' queries and result in different behavior. Moreover this behavior is currently buggy. See mu-elastic-search documentation for more.

### Tweak the Configuration

Changes to the config file in `./config/elastic/config.json` trigger a reload of all indexes.

Easy changes are adding/removing `eager_indexing_groups`:

     "eager_indexing_groups" : [["group1"]],

to 

     "eager_indexing_groups" : [],

and turning on/off the `persist_indexes` option.

### Testing Environment

A simple testing environment is provided, and demonstrated in `./mu-elastic-search/testing/basic-tests.rb`. The provided tests DO NOT reflect the current model.


