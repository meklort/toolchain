cmake_minimum_required (VERSION 2.8)

project (toolchain)

set(CMAKE_INSTALL_PREFIX "/opt/xZenue/")

add_subdirectory (external)



SET(CPACK_GENERATOR "TBZ2")

SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "xZenue Toolchain")
SET(CPACK_PACKAGE_VENDOR "xZenue LLC")

SET(CPACK_PACKAGE_INSTALL_DIRECTORY ${CMAKE_INSTALL_PREFIX})
SET(CPACK_PACKAGING_INSTALL_PREFIX  ${CMAKE_INSTALL_PREFIX})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY 0)


INCLUDE(CPack)

