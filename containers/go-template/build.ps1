mkdir build

# On Windows, we use Go Docker build container to compile a Go app for Linux
# TODO Dockerfile.build

# Generate self-signed cert
$env:GOBIN="$pwd" + "/build/"
go install $env:GOROOT/src/crypto/tls/generate_cert.go
build/generate_cert --host localhost
mv cert.pem build/
mv key.pem build/

# Create minimal container with the result of the build
go build -o build/server.exe server/server.go

docker build -t fluux-go-tmpl -f Dockerfile .
