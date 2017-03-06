mkdir build

# On Windows, we use Go Docker build container to compile a Go app for Linux
# TODO Dockerfile.build

# Create minimal container with the result of the build
go build -o build/server server/server.go

docker build -t fluux-go-tmpl -f Dockerfile .
