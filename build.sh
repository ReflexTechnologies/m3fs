REV_FULL=$(git rev-parse HEAD 2>/dev/null || echo "dev")
DATE=$(date -u +%Y-%m-%dT%H:%M:%SZ)
VER=$(git describe --tags --always --dirty 2>/dev/null || echo "dev")

CGO_ENABLED=0 go build -trimpath -ldflags="-s -w \
  -X github.com/open3fs/m3fs/pkg/common.GitSha=${REV_FULL} \
  -X github.com/open3fs/m3fs/pkg/common.BuildTime=${DATE} \
  -X github.com/open3fs/m3fs/pkg/common.Version=${VER}" \
  -o m3fs ./cmd/m3fs
