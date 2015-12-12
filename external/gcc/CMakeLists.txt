include (ExternalProject)

set(PGKURL NONE)

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
set(PKGURL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2)
ENDIF()

IF(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
set(PKGURL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2)
ENDIF()

#IF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
#set(PGKURL https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-win32.exe)
#ENDIF()


IF(NOT ${PKGURL} STREQUAL NONE)
message("URL is ${PKGURL}")
ExternalProject_Add (gcc
	URL		${PKGURL}

	CONFIGURE_COMMAND 	""
	BUILD_COMMAND	""
	INSTALL_COMMAND	""
)

ExternalProject_Get_Property(gcc SOURCE_DIR)
install(DIRECTORY ${SOURCE_DIR}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
        )

ENDIF()
