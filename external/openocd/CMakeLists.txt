include (ExternalProject)

ExternalProject_Add (libusb
	URL		http://iweb.dl.sourceforge.net/project/libusb/libusb-1.0/libusb-1.0.20/libusb-1.0.20.tar.bz2
#	GIT_REPOSITORY	https://github.com/libusb/libusb.git
#	GIT_TAG		v1.0.20

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --disable-static --prefix=${CMAKE_INSTALL_PREFIX}
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
)

#ExternalProject_Add_Step(libusb bootstrap
#	COMMAND			<SOURCE_DIR>/bootstrap.sh
#	DEPENDERS		configure	
#	DEPENDEES		download
#	WORKING_DIRECTORY	<SOURCE_DIR>
#)



ExternalProject_Add (openocd
	DEPENDS		libusb
	URL		http://iweb.dl.sourceforge.net/project/openocd/openocd/0.9.0/openocd-0.9.0.tar.bz2
#	GIT_REPOSITORY	http://git.code.sf.net/p/openocd/code
#	GIT_TAG		v0.9.0

	PATCH_COMMAND		patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/openocd.patch
	CONFIGURE_COMMAND	<SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} --enable-ftdi --enable-stlink --enable-maintainer-mode --srcdir=<SOURCE_DIR>
	INSTALL_COMMAND 	make DESTDIR=<INSTALL_DIR> install
)

ExternalProject_Add_Step(openocd remove-к1879xб1я.cfg
	COMMAND			rm <INSTALL_DIR>/${CMAKE_INSTALL_PREFIX}/share/openocd/scripts/target/к1879xб1я.cfg
	DEPENDERS		
	DEPENDEES		install
	WORKING_DIRECTORY	<INSTALL_DIR>
)


ExternalProject_Get_Property(libusb INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
	PATTERN "include/" EXCLUDE
	PATTERN "include/*" EXCLUDE
        )

ExternalProject_Get_Property(openocd INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
        )
