FROM       google/golang

MAINTAINER Salvador Girones <salvador@redbooth.com>
MAINTAINER Ferran Basora <ferran@redbooth.com>

ADD        ./karver/ /gopath/src/karver/

WORKDIR    /gopath/src/karver

RUN        go get
RUN        go install karver

CMD        ["--migrations", "/migrations", "--target", "/target", "run"]

ENTRYPOINT ["/gopath/bin/karver"]
