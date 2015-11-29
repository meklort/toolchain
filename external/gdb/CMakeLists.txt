include (ExternalProject)

ExternalProject_Add (gdb
#	DEPENDS		libusb
	URL		http://ftp.gnu.org/gnu/gdb/gdb-7.10.tar.gz

	CONFIGURE_COMMAND	<SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} --with-expat --enable-targets=all --srcdir=<SOURCE_DIR>
	BUILD_COMMAND		make -j8
	INSTALL_COMMAND 	make DESTDIR=<INSTALL_DIR> install
)

ExternalProject_Get_Property(gdb INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
	PATTERN "lib/*.a" EXCLUDE
	PATTERN "*.h" EXCLUDE
        )
