How to use Karver against Docker
--------------------------------

```
$ docker run -v /target-path --name="target-container" busybox mkdir /target-path/foo

$ docker run --volumes-from target-container busybox ls /target-path
foo

$ mkdir migrations
$ docker run -v `pwd`/migrations:/migrations karver/karver --migrations /migrations create 'foo to bar'
New migration: /migrations/20140605050125_foo_to_bar.sh

$ cat > migrations/20140605050125_foo_to_bar.sh << EOF
#!/bin/bash
TARGET=\$1

mv \$TARGET/foo \$TARGET/bar
EOF

$ docker run -v `pwd`/migrations:/migrations --volumes-from target-container karver/karver --migrations /migrations --target /target-path run
2014/06/05 05:05:11 Karving /target-path...
2014/06/05 05:05:11 Running migration 20140605050125_foo_to_bar.sh...
2014/06/05 05:05:11 /target-path has been karved. :D

$ docker run --volumes-from target-container busybox ls /target-path
bar
```
