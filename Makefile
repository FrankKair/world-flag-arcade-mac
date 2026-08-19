.PHONY: build run clean

build:
	swift build

run: build
	swift run

clean:
	swift package clean
