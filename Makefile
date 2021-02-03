.PHONY: public deploy clean

themes/academic/README.md:
	git submodule init
	git submodule update --recursive

build: themes/academic/README.md
	hugo

local:
	hugo server -w

clean:
	rm -rf public

RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh --perms --chmod=Du=rwx,Dgo=rwx,Fu=rw,Fog=r
DEST := cslinux:/research/pl

deploy: clean build
	rsync $(RSYNCARGS) public/ $(DEST)
