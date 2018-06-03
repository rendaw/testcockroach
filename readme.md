# In-Memory Cockroach server for testing

As suggested [here](https://github.com/cockroachdb/cockroach/issues/4253) this is an unendorsed Dockerization of Cockroach's in-memory testing server.  It starts up in milliseconds for me.

# Usage

```
docker run -it --rm -p 26257:26257 --name testing_cockroach rendaw/testcockroach:v2.0.2
```

Then create a database with:
```
docker exec testing_cockroach ./cockroach sql --insecure --execute='CREATE DATABASE dog;'
```

And connect with:
```
$ psql -h localhost -p 26257 -U root dog
psql (10.3, server 9.5.0)
Type "help" for help.

dog=> create table Gum (height integer);
CREATE TABLE
dog=> \q
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
* At the time of development, protobufjs 6.7.3 404s for me on npm, so I switched to 6.8.6