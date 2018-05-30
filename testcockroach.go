package main

import (
	"context"
	"os"
	"os/signal"
	"syscall"
	"github.com/cockroachdb/cockroach/pkg/base"
	"github.com/cockroachdb/cockroach/pkg/server"
)

func main() {
	ctx := context.Background()
	args := base.TestServerArgs{
		Insecure: true,
		Addr: "0.0.0.0:26257",
		HTTPAddr: "0.0.0.0:8080",
	}
	server := server.TestServerFactory.New(args).(*server.TestServer)
	if err := server.Start(args); err != nil {
		panic(err)
	}
	defer server.Stopper().Stop(ctx)
	var sigEvents = make(chan os.Signal, 1)
	signal.Notify(sigEvents, syscall.SIGTERM)
	signal.Notify(sigEvents, syscall.SIGINT)
	<-sigEvents
}