set(ENABLE_cmb ON CACHE BOOL "")

set(ENABLE_python2 OFF CACHE BOOL "")
set(ENABLE_python3 ON CACHE BOOL "")

set(CTEST_USE_LAUNCHERS "ON" CACHE STRING "")

# Enable SMTK testing.
set(TEST_smtk "ON" CACHE BOOL "")
set(smtk_FETCH_LFS "ON" CACHE BOOL "")

# Disable CMB testing.
set(TEST_cmb "OFF" CACHE BOOL "")

# Suppress various project outputs. It is too large for the log to follow.
set(SUPPRESS_itk_OUTPUT "ON" CACHE BOOL "")
set(SUPPRESS_paraview_OUTPUT "ON" CACHE BOOL "")
set(SUPPRESS_python3_OUTPUT "ON" CACHE BOOL "")
set(SUPPRESS_qt5_OUTPUT "ON" CACHE BOOL "")

# Hide some "errors" from CTest. Remove when Python2 is no longer needed.
set(SUPPRESS_pythonsetuptools_OUTPUT "ON" CACHE BOOL "")

# Default to Release builds.
if ("$ENV{CMAKE_BUILD_TYPE}" STREQUAL "")
  set(CMAKE_BUILD_TYPE "Release" CACHE STRING "")
else ()
  set(CMAKE_BUILD_TYPE "$ENV{CMAKE_BUILD_TYPE}" CACHE STRING "")
endif ()

# Build binaries that will run on older architectures
if ("$ENV{CMAKE_CONFIGURATION}" MATCHES "centos7")
  set(CMAKE_C_FLAGS "-march=core2 -mno-avx512f" CACHE STRING "")
  set(CMAKE_CXX_FLAGS "-march=core2 -mno-avx512f" CACHE STRING "")
endif ()

# if (NOT "$ENV{CI_JOB_NAME}" MATCHES "windows")
#   include("${CMAKE_CURRENT_LIST_DIR}/configure_sccache.cmake")
# endif ()
