### Create a Karver container with the needed migrations
```
$ ls custom_karver_container/
Dockerfile    migrations/

$ cat Dockerfile
FROM karver/karver

ADD ./migrations/20140605050125_foo_to_bar.sh /migrations/

RUN chmod +x /migrations/*

$ docker build -t="custom_karver_migrations" .
```


### Run you custom Karver image against a Docker container

```
$ docker run -v /target-path --name="target-container" busybox mkdir /target-path/foo


$ docker run --volumes-from target-container custom_karver_migrations --target /target-path run
2014/06/05 05:05:11 Karving /target-path...
2014/06/05 05:05:11 Running migration 20140605050125_foo_to_bar.sh...
2014/06/05 05:05:11 /target-path has been karved. :D
```
