from golang:1.10.2 as build
run apt-get update && apt-get -y upgrade
run apt-get install -y build-essential
run apt-get install -y git
run apt-get install -y cmake
run apt-get install -y autoconf
run apt-get install -y libncurses-dev
run curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs
run npm install -g yarn
env GOPATH /go
run go get -d github.com/cockroachdb/cockroach
run yarn config set registry https://registry.npmjs.org
run (cd /go/src/github.com/cockroachdb/cockroach && sed -i 's/6.7.3/6.8.6","espree":"","escodegen":"","estraverse":"/g' pkg/ui/package.json && grep 6.8.6 pkg/ui/package.json && make buildoss)
add . /go/src/github.com/micromicromicro/testcockroach
run (cd /go/src/github.com/micromicromicro/testcockroach && go install)
from golang:1.10.2
copy --from=build /go/bin/testcockroach .
cmd ./testcockroach
entrypoint []
expose 8080
expose 26257