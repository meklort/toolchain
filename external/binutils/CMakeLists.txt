include (ExternalProject)

#SET(config --disable-nls --disable-multilib --enable-interwork --disable-static --enable-shared -enable-targets=all -disable-target=elf32-littlearm-symbian -disable-target=elf32-littlearm-vxworks)
#SET(config --disable-nls --disable-multilib --enable-interwork --disable-static --enable-shared --target=arm-linux-eabi --program-prefix=)
#SET(config --disable-nls --disable-multilib --enable-interwork --disable-static --enable-shared --target=arm-linux-eabi )

SET(config --disable-nls --disable-multilib --enable-interwork --disable-static --enable-shared --target=arm-linux-eabi --program-prefix= -enable-targets=all)

ExternalProject_Add (binutils
#	URL		http://gnu.mirror.iweb.com/binutils/binutils-2.25.1.tar.bz2
	URL		http://gnu.mirror.iweb.com/binutils/binutils-2.25.tar.bz2

	CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${CMAKE_INSTALL_PREFIX} ${config}
	INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install
	#INSTALL_COMMAND make DESTDIR=<INSTALL_DIR> install && cd <INSTALL_DIR>/${CMAKE_INSTALL_PREFIX}/bin/ && cmake -E create_symlink arm-linux-eabi-ld ld
	BUILD_COMMAND make -j4
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
