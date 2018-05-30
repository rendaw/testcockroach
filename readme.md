# In-Memory Cockroach server for testing

As suggested [here](https://github.com/cockroachdb/cockroach/issues/4253) this is an unendorsed Dockerization of Cockroach's in-memory testing server.  It starts up in milliseconds for me.

Usage:

```
docker run 
```

Then create a database with:
```
``

And connect with:
```
```

PRs for new versions welcome!

# Ports

* 8080
* 26257

# Development

1. Clone this repository
2. Run `docker build -t testcockroach .`

# Notes

* Various protobufjs runtime dependencies aren't installed, so I hacked them into the frontend package.json with sed
* At the time of development, protobufjs 6.7.3 404s on npm, so I switched to 6.8.6