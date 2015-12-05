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
