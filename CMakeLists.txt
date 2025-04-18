CMAKE_MINIMUM_REQUIRED(VERSION 2.8...3.16)

SET(_TARGET gn)
PROJECT(${_TARGET})

IF (NOT WIN32)
    SET(EXTRA_LIBS pthread)
ENDIF()

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
SET(EXEC_PATH ${CMAKE_CURRENT_SOURCE_DIR}/build)

FILE(GLOB SOURCE_FILES "*.c*")
ADD_EXECUTABLE(${_TARGET} ${SOURCE_FILES})
TARGET_LINK_LIBRARIES(${_TARGET} ${EXTRA_LIBS})
INSTALL(TARGETS ${_TARGET} RUNTIME DESTINATION .)

IF (${CMAKE_HOST_SYSTEM_NAME} MATCHES "Linux")
    #ADD_DEFINITIONS("-Wno-extra")
    ADD_DEFINITIONS("-Wno-format")
ENDIF()

IF (WIN32)
    SET(_TARGET_ "${_TARGET}.exe")
    IF (${CMAKE_BUILD_TYPE} STREQUAL "Release")
        SET(_TARGET_ "${CMAKE_BUILD_TYPE}/${_TARGET}.exe")
    ENDIF()
    SET(EXEC_PATH ${CMAKE_CURRENT_SOURCE_DIR}/out/)
ELSE()
    SET(_TARGET_ ${_TARGET})
ENDIF()

ADD_CUSTOM_COMMAND(
    TARGET ${_TARGET}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${EXEC_PATH}
    COMMENT "-- 'gn' is a cross-platform tool to generate numbers."
)
