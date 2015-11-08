include (ExternalProject)

ExternalProject_Add (llvm
	URL		http://llvm.org/releases/3.7.0/llvm-3.7.0.src.tar.xz
#	GIT_REPOSITORY	https://github.com/libusb/libusb.git
#	GIT_TAG		v1.0.20

	CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DLLVM_TARGET_ARCH:STRING=arm-unknown-linux -DCMAKE_BUILD_TYPE:STRING=Release
)

ExternalProject_Get_Property(llvm INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
        )

