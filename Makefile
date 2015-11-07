all: build/Makefile
	cd build && make


install: build/Makefile
	cd build && make install

build/Makefile:
	mkdir -p build
	cd build && cmake ..

