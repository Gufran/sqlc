FROM golang:1.15 as builder

COPY . /workspace
WORKDIR /workspace

RUN /bin/bash build-custom.sh

FROM scratch
COPY --from=builder /workspace/pkg/sqlc /sqlc
ENTRYPOINT ["/sqlc"]
