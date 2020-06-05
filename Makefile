PATH := ${PATH}:./node_modules/.bin

app_bundle := node_modules css

.PHONY: clean

all: $(app_bundle)

node_modules: package.json package-lock.json
	npm install

css: src/stylus/style.styl
	mkdir -p dist/styles
	stylus src/stylus/style.styl --out dist/styles/style.css

watch:
	watch -n .6 'make'

clean:
	rm -rf node_modules dist/styles/*
