cmake_minimum_required (VERSION 2.8)

project (toolchain)

set(CMAKE_INSTALL_PREFIX "/opt/xZenue/")

add_subdirectory (external)



SET(CPACK_GENERATOR "TGZ")

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "xZenue Toolchain")
SET(CPACK_PACKAGE_VENDOR "xZenue LLC")

INCLUDE(CPack)

