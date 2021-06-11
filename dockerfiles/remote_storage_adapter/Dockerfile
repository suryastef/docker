FROM golang:alpine as builder
RUN apk update && apk add --no-cache git
RUN git clone --depth 1 https://github.com/prometheus/prometheus.git src/prometheus
RUN cd /go/src/prometheus/documentation/examples/remote_storage/remote_storage_adapter && CGO_ENABLED=0 go build
RUN mv /go/src/prometheus/documentation/examples/remote_storage/remote_storage_adapter/remote_storage_adapter /go


FROM scratch
COPY --from=builder /go/remote_storage_adapter /bin/remote_storage_adapter
ENTRYPOINT ["/bin/remote_storage_adapter"]
