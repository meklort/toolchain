include (ExternalProject)


ExternalProject_Add (download-clang
	URL		http://llvm.org/releases/3.7.0/cfe-3.7.0.src.tar.xz

	CONFIGURE_COMMAND 	""
	BUILD_COMMAND	""
	INSTALL_COMMAND	""
)


ExternalProject_Add (llvm
	DEPENDS		download-clang
	URL		http://llvm.org/releases/3.7.0/llvm-3.7.0.src.tar.xz
#	GIT_REPOSITORY	https://github.com/libusb/libusb.git
#	GIT_TAG		v1.0.20

	CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR> -DLLVM_TARGET_ARCH:STRING=arm-unknown-linux -DCMAKE_BUILD_TYPE:STRING=Release
)


ExternalProject_Get_Property(download-clang SOURCE_DIR)
ExternalProject_Add_Step(llvm copy-clang
	DEPENDEES	download
	DEPENDERS	build
	WORKING_DIRECTORY	<SOURCE_DIR>
	COMMAND		ln -s ${SOURCE_DIR} tools/clang
)


ExternalProject_Get_Property(llvm INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
        )

