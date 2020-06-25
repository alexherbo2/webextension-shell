static ?= no

ifeq ($(static),yes)
  build = build-static
else
  build = build
endif

all: chrome chromium brave firefox

chrome: $(build)
	./scripts/install-manifest chrome

chromium: $(build)
	./scripts/install-manifest chromium

brave: $(build)
	./scripts/install-manifest brave

firefox: $(build)
	./scripts/install-manifest firefox

build:
	shards build --release

build-static:
	./scripts/build-static

install: $(build)
	./scripts/install-manifest chrome chromium brave firefox

uninstall:
	./scripts/uninstall-manifest chrome chromium brave firefox

clean:
	rm -Rf bin
