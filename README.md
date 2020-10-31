# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
```
docker run -d --name=redis --restart=always --network=host redis
docker run -d --name=grafana --restart=always --network=host grafana/grafana
docker run -d --name=influxdb --restart=always --network=host influxdb
curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE mydb"

docker build -t mysidekiq .
docker rm -f rubydev && docker run -itd --name=rubydev -e RAILS_ENV=development -e RAILS_MAX_THREADS=82 --network=host mysidekiq /bin/sh -c "rake db:migrate && rails s -b 0.0.0.0 -p 3001"
docker rm -f rubytest && docker run -itd --name=rubytest -e RAILS_ENV=test -e RAILS_MAX_THREADS=82 --network=host mysidekiq /bin/sh -c "rake db:migrate && rails s -b 0.0.0.0 -p 3002"
```