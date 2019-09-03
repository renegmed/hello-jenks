.PHONY: build
build:
	docker build . -t getintodevops-hellonode:1

.PHONY: run
run:
	docker run -it -p 8000:8000 getintodevops-hellonode:1


