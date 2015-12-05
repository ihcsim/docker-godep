FROM golang:1.5
MAINTAINER Ivan Sim "ihcsim@gmail.com"

RUN go get github.com/tools/godep
ENTRYPOINT [ "godep" ]
