
# BUILD_FLAGS=--pedantic --library-profiling --executable-profiling
BUILD_FLAGS=--pedantic

RUN=stack exec -- tps-report

run: build report.md

report.md:
	$(RUN) --libanalytics "$(LIBANALYTICS)" --username $(COMP_ID) \
		--output $@

init: stack.yaml

stack.yaml:
	stack init --prefer-nightly

docs:
	stack haddock
	open `stack path --local-doc-root`/index.html

# package:
# build a release tarball or executable
#
# dev:
# start dev server or process. `vagrant up`, `yesod devel`, etc.
#
# deploy:
# prep and push

configure:
	cabal configure \
		--package-db=clear \
		--package-db=global \
		--package-db=`stack path --snapshot-pkg-db` \
		--package-db=`stack path --local-pkg-db`

install:
	stack install

tags: $(SRC)
	codex update

hlint:
	hlint *.hs src specs

clean:
	stack clean
	codex cache clean

distclean: clean
	rm stack.yaml

build:
	stack build $(BUILD_FLAGS)

test:
	stack test $(BUILD_FLAGS)

bench:
	stack bench $(BUILD_FLAGS)

watch:
	ghcid "--command=stack ghci"

watch-test:
	stack test $(BUILD_FLAGS) --file-watch # --test-arguments "-m TODO"

watch-build:
	stack build $(BUILD_FLAGS) --file-watch --fast

watch-run:
	stack build $(BUILD_FLAGS) --file-watch --fast --exec make

restart: distclean init build

rebuild: clean build

.PHONY: init run docs configure install hlint clean distclean build test
.PHONY: bench watch watch-test restart rebuild
