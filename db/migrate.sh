#!/bin/bash

rake neo4j:generate_schema_migration[constraint,Aod::Models::Hero,uuid]
sleep 3
rake neo4j:generate_schema_migration[constraint,Aod::Models::Voucher,uuid]
sleep 3
rake neo4j:generate_schema_migration[index,Aod::Models::Hero,facebook_token]
sleep 3

rake neo4j:migrate
rake neo4j:migrate:status

cat db/neo4j/schema.yml
