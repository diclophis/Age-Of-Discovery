#!/bin/bash

bundle exec rake neo4j:generate_schema_migration[constraint,Aod::Models::Hero,uuid]
sleep 1
bundle exec rake neo4j:generate_schema_migration[constraint,Aod::Models::Voucher,uuid]
sleep 1
bundle exec rake neo4j:generate_schema_migration[constraint,Aod::Models::Rank,uuid]
sleep 1

bundle exec rake neo4j:migrate
bundle exec rake neo4j:migrate:status

cat db/neo4j/schema.yml
