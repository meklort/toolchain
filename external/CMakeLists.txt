include (ExternalProject)

ExternalProject_Add (libusb
	GIT_REPOSITORY	https://github.com/libusb/libusb.git
	GIT_TAG		v1.0.20
##	INSTALL_DIR	${CMAKE_INSTALL_PREFIX}

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX}
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
)

ExternalProject_Add_Step(libusb bootstrap
	COMMAND			<SOURCE_DIR>/bootstrap.sh
	DEPENDERS		configure	
	DEPENDEES		download
	WORKING_DIRECTORY	<SOURCE_DIR>
)


ExternalProject_Add (pkg-config
	URL		http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.tar.gz

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --with-internal-glib

	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
)

set(ENV{PKG_CONFIG} ExternalProject_Get_Property(pkg-config INSTALL_DIR))

ExternalProject_Add (openocd
	DEPENDS		libusb pkg-config
	GIT_REPOSITORY	http://git.code.sf.net/p/openocd/code
	GIT_TAG		v0.9.0
##	INSTALL_DIR	${CMAKE_INSTALL_PREFIX}

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} --enable-ftdi --enable-stlink --enable-maintainer-mode --srcdir=<SOURCE_DIR>
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install

)

ExternalProject_Add_Step(openocd bootstrap
        COMMAND                 <SOURCE_DIR>/bootstrap
        DEPENDERS               configure
        DEPENDEES               download
        WORKING_DIRECTORY       <SOURCE_DIR>
)

