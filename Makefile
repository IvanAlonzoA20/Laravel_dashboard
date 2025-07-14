# Docker commands
up:
	docker-compose up -d --build

down:
	docker-compose down

restart:
	docker-compose down && docker-compose up -d --build

shell:
	docker-compose exec app sh

# Laravel commands
migrate:
	docker-compose exec app php artisan migrate

seed:
	docker-compose exec app php artisan db:seed

migrate-fresh:
	docker-compose exec app php artisan migrate:fresh --seed

artisan:
	docker-compose exec app php artisan

# NPM commands
npm-install:
	docker-compose exec app npm install

npm-build:
	docker-compose exec app npm run build

npm-dev:
	docker-compose exec app npm run dev

# Composer
composer:
	docker-compose exec app composer install

test:
	docker-compose exec app php artisan test
