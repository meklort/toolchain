include (ExternalProject)


ExternalProject_Add (ninja
	URL		https://github.com/ninja-build/ninja/archive/release.zip
#	GIT_REPOSITORY	https://github.com/ninja-build/ninja.git
#	GIT_TAG		release
	
	CONFIGURE_COMMAND ""
	BUILD_COMMAND	./configure.py --bootstrap
	BUILD_IN_SOURCE 1

	INSTALL_COMMAND	""
)


ExternalProject_Get_Property(ninja SOURCE_DIR)
install(PROGRAMS ${SOURCE_DIR}/ninja
        DESTINATION bin
        )

