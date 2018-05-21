VERSION=0.1
REPO=emotiq/ubuntu-dev:${VERSION}

build:
	docker build --squash -t ${REPO} .

publish: build
	docker push ${REPO}
