name := webextension-shell
version := $(shell git describe --tags --always)
target := $(shell llvm-config --host-target)
static ?= no

ifeq ($(static),yes)
  flags += --static
endif

default: build

all = chrome chromium brave firefox

all: install

chrome: build
	scripts/install-manifest chrome

chromium: build
	scripts/install-manifest chromium

brave: build
	scripts/install-manifest brave

firefox: build
	scripts/install-manifest firefox

build:
	shards build --release $(flags)

x86_64-unknown-linux-musl:
	scripts/build-linux

x86_64-apple-darwin: build

release: $(target)
	mkdir -p releases
	echo scripts/install-manifest chrome chromium brave firefox > README.txt
	zip -r releases/$(name)-$(version)-$(target).zip README.txt bin manifest scripts/install-manifest scripts/uninstall-manifest scripts/*-target.sh

install: build
	scripts/install-manifest $(all)

uninstall:
	scripts/uninstall-manifest $(all)

clean:
	rm -Rf bin releases
