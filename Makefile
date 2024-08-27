vendor/hugo/hugo:
	go build -C ./vendor/hugo

PHONY: local-server

local-server: vendor/hugo/hugo
	./vendor/hugo/hugo server -w
