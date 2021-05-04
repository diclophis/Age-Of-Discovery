#!/bin/bash

set -e
set -x

polly build

#docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm -p 9292:9292 age-of-discovery:latest bash script/migrate.sh

#docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm -p 9292:9292 age-of-discovery:latest bundle exec rspec --fail-fast

docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm -p 9292:9292 age-of-discovery:latest bundle exec rerun -- rackup -o 0.0.0.0 -p 9292 config.ru

#docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" --rm -p 9292:9292 age-of-discovery:latest bundle exec rackup -o 0.0.0.0 -p 9292 config.ru
#docker run -it --rm -p 9292:9292 age-of-discovery:latest bundle exec rackup -o 0.0.0.0 -p 9292 config.ru
# docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm -p 9292:9292 age-of-discovery:latest bundle exec rackup -o 0.0.0.0 -p 9292 config.ru
# app: docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm -p 9292:9292 age-of-discovery:latest 
#docker run -it --rm -p 9292:9292 age-of-discovery:latest bundle exec irb
#docker run --mount "type=bind,src=$(pwd),dst=/home/app/current" -it --rm age-of-discovery:latest bundle exec irb
