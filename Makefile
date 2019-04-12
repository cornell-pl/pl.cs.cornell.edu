.PHONY: public deploy clean

build:
	hugo

clean:
	rm -rf public

RSYNCARGS := --compress --recursive --checksum --itemize-changes \
	--delete -e ssh --perms --chmod=Du=rwx,Dgo=rx,Fu=rw,Fog=r
DEST := cslinux:/research/pl

deploy: clean build
	rsync $(RSYNCARGS) public/ $(DEST)
