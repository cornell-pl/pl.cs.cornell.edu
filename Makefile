.PHONY: public deploy clean

themes/academic/README.md:
	git submodule init
	git submodule update --recursive

build: themes/academic/README.md
	hugo

clean:
	rm -rf public

RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh --no-perms --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r
DEST := cslinux:/research/pl

deploy: clean build
	rsync $(RSYNCARGS) public/ $(DEST)
