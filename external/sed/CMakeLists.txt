include (ExternalProject)

ExternalProject_Add (sed
	URL		http://gnu.mirror.iweb.com/sed/sed-4.2.2.tar.bz2
#	GIT_REPOSITORY	https://github.com/libusb/libusb.git
#	GIT_TAG		v1.0.20

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX}
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
)

ExternalProject_Get_Property(sed INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
        )
