include (ExternalProject)

SET(config --disable-nls --disable-multilib --enable-interwork --disable-static --enable-shared --target=i386-apple-darwin10 --program-prefix= -enable-targets=all)

ExternalProject_Add (binutils
	URL		http://gnu.mirror.iweb.com/binutils/binutils-2.25.tar.bz2
#	URL		http://gnu.mirror.iweb.com/binutils/binutils-2.27.tar.bz2

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} ${config}
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
	BUILD_COMMAND make -j4

	PATCH_COMMAND		patch -R -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/binutils-2.25.patch

)

ExternalProject_Get_Property(binutils INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
	PATTERN "include/*" EXCLUDE
	PATTERN "include/" EXCLUDE
	PATTERN "*.h" EXCLUDE
	PATTERN "*.a" EXCLUDE
        )
