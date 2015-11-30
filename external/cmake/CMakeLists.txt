include (ExternalProject)


ExternalProject_Add (cmake
	URL		https://cmake.org/files/v3.4/cmake-3.4.0-rc3.tar.gz
	
	CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>/${CMAKE_INSTALL_PREFIX} -DCMAKE_BUILD_TYPE:STRING=Release
	PATCH_COMMAND           patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/cmake.patch

)

ExternalProject_Get_Property(cmake INSTALL_DIR)
install(DIRECTORY ${INSTALL_DIR}/${CMAKE_INSTALL_PREFIX}/
        DESTINATION .
	USE_SOURCE_PERMISSIONS
        )

