all: build/CMakeCache.txt
	@cd build && cmake --build .


install: build/CMakeCache.txt
	@cd build && cmake --build . --target install

cpack: build/CMakeCache.txt
	@cd build && cpack

clean:
	rm -rf build

build/CMakeCache.txt: Makefile
	@mkdir -p build
	@cd build && cmake ..
	@# -DCMAKE_VERBOSE_MAKEFILE=Yes
	@#cd build && cmake .. -DCMAKE_VERBOSE_MAKEFILE=Yes

