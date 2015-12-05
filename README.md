### Godep

Docker image to run Godep.

### Tags

* [latest](https://github.com/ihcsim/docker-godep/tree/latest)

### Usage

* To pull: `docker pull isim/godep`
* To run: `docker run --rm isim/godep [<godep_command>]`

### Sample Build Script

This is a sample script to run `godep go build -v` inside the Docker container. Notice that by setting `godep` as the container entrypoint, it automatically picks up all the dependencies in `godep pwd`.

To run: `$./gobuild-sample.sh <package>`

```sh
#!/bin/bash

COLOR_NO="\033[0m"
COLOR_OK="\033[32;01m"
COLOR_ERROR="\033[31;01m"
PACKAGE=$1

if [ -z $PACKAGE ]; then
  echo -e "${COLOR_ERROR}Specify package to be built${COLOR_NO}"
  exit 1
fi

PACKAGE_PATH=$GOPATH/src/$PACKAGE
pushd $PACKAGE_PATH

echo -e "${COLOR_OK}Building package $PACKAGE at $PACKAGE_PATH${COLOR_NO}"
docker run --rm \
    -v `pwd`:/go/src/$PACKAGE \
    -w /go/src/$PACKAGE \
    isim/godep go build -v
popd
```
