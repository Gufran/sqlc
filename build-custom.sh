set -eou pipefail

GIT_SHA=$(git rev-parse --short HEAD)
LD_FLAGS_VERSION="-X github.com/kyleconroy/sqlc/internal/cmd.version=custom-${GIT_SHA}"

export CGO_ENABLED=1

set -x
go build -v -o pkg/sqlc -ldflags "-extldflags \"-static\" ${LD_FLAGS_VERSION}" ./cmd/sqlc