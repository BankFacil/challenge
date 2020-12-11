install:
	pip3 install -r requirements.txt

run:
	python3 -m src

test:
	python3 -m unittest -v

docker-build:
	docker build -t shopping-1.0 .

docker-run: docker-build
	docker run --rm shopping-1.0
