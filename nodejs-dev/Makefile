VERSION=0.1
REPO=emotiq/nodejs-dev:${VERSION}

build:
	docker build --squash -t ${REPO} .

publish: build
	docker push ${REPO}
