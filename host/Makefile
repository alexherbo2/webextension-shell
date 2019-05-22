build:
	shards build --release

install: build
	./scripts/install-manifest chrome chromium

uninstall:
	./scripts/uninstall-manifest chrome chromium

clean:
	rm -Rf bin
