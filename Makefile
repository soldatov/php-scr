build:
	docker build -t php_src .

run-index:
	docker-compose run --rm php_src php index.php
