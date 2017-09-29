package: package-prebuild
	docker run --rm -v `pwd`:/docker `docker build -qf Dockerfile.package .`

package-prebuild:
	docker build -f Dockerfile.package .

image: package
	docker build --tag=keepalived-dev -f Dockerfile.image .

run: image
	docker run --cap-add=NET_ADMIN --rm -ti keepalived-dev bash -l

all: package image

clean:
	rm build/* || true

.PHONY: all package package-prebuild image clean
