include (ExternalProject)

ExternalProject_Add (libusb
	GIT_REPOSITORY	https://github.com/libusb/libusb.git
	GIT_TAG		v1.0.20

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --disable-static --prefix=${CMAKE_INSTALL_PREFIX}
	INSTALL_COMMAND make DESTDIR=${CMAKE_BINARY_DIR} install
)
message("BINDIR is ${CMAKE_BINARY_DIR}")
message("INSTALL is ${CMAKE_INSTALL_PREFIX}")

ExternalProject_Add_Step(libusb bootstrap
	COMMAND			<SOURCE_DIR>/bootstrap.sh
	DEPENDERS		configure	
	DEPENDEES		download
	WORKING_DIRECTORY	<SOURCE_DIR>
)



ExternalProject_Add (openocd
	DEPENDS		libusb
	URL		http://iweb.dl.sourceforge.net/project/openocd/openocd/0.9.0/openocd-0.9.0.tar.bz2
#	GIT_REPOSITORY	http://git.code.sf.net/p/openocd/code
#	GIT_TAG		v0.9.0

	PATCH_COMMAND		patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/openocd.patch
	CONFIGURE_COMMAND	<SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} --enable-ftdi --enable-stlink --enable-maintainer-mode --srcdir=<SOURCE_DIR>
	INSTALL_COMMAND 	make DESTDIR=${CMAKE_BINARY_DIR} install

)

