all: build/Makefile
	cd build && make


install: build/Makefile
	cd build && make install

cpack:
	cd build && cpack

clean:
	rm -rf build

build/Makefile:
	mkdir -p build
	cd build && cmake ..

