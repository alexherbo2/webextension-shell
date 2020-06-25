static ?= no

ifeq ($(static),yes)
  build = build-static
else
  build = build
endif

all = chrome chromium brave firefox

all: $(all)

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
	./scripts/install-manifest $(all)

uninstall:
	./scripts/uninstall-manifest $(all)

clean:
	rm -Rf bin
