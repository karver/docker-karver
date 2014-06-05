all: clone docker

clone:
	if [ -d karver ]; then cd karver && git pull --rebase ; else git clone git@github.com:karver/karver.git; fi

docker:
	docker build -t 'karver/karver' .

clean:
	rm -rf karver
