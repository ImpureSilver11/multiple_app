usage:
	echo [build bash up stop db setup]


up:
	docker-compose up

build:
	docker-compose build --no-cache

one_bash:
	docker-compose exec app1 bash

two_bash:
	docker-compose exec app2 bash

stop:
	docker-compose down

migrate:
	docker-compose exec app1 bundle exec rails db:environment:set RAILS_ENV=development
	docker-compose exec app2 bundle exec rails db:environment:set RAILS_ENV=development
	docker-compose exec app1 bundle exec rails db:drop db:create db:migrate:reset db:seed
	docker-compose exec app2 bundle exec rails db:drop db:create db:migrate:reset db:seed

db:
	docker-compose exec postgres bash

