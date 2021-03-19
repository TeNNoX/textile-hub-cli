FROM golang:alpine as build

RUN apk add --no-cache git

# Clone and build
RUN git clone https://github.com/textileio/textile /build
WORKDIR /build
RUN go get ./cmd/hub

FROM tennox/alpine-plus-basics as run

COPY --from=build /go/bin/hub /usr/local/bin/hub

ENTRYPOINT [ "hub" ]