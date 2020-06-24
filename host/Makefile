static ?= no

ifeq ($(static),yes)
  build = build-static
else
  build = build
endif

all: chrome chromium firefox

brave: $(build)
	./scripts/install-manifest brave

chrome: $(build)
	./scripts/install-manifest chrome

chromium: $(build)
	./scripts/install-manifest chromium

firefox: $(build)
	./scripts/install-manifest firefox

build:
	shards build --release

build-static:
	./scripts/build-static

install: $(build)
	./scripts/install-manifest chrome chromium firefox

uninstall:
	./scripts/uninstall-manifest chrome chromium firefox

clean:
	rm -Rf bin
