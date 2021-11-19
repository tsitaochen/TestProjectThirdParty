cmake_minimum_required(VERSION 2.8.4)

file(GLOB_RECURSE SOURCES *.cpp *.cxx *.cc)

# 将这个文件夹加入include的范围，这个文件夹下的.h文件
include_directories(${COMMON_INCLUDE_DIR})

set(LIBHELLO_SRC hello.c)

add_library(hello_dynamic SHARED ${LIBHELLO_SRC})
add_library(hello_static STATIC ${LIBHELLO_SRC})

set_target_properties(hello_dynamic PROPERTIES OUTPUT_NAME "hello")
set_target_properties(hello_dynamic PROPERTIES VERSION 1.2 SOVERSION 1)

set_target_properties(hello_static PROPERTIES OUTPUT_NAME "hello")

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

install(TARGETS hello_dynamic hello_static
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
        
install(FILES hello.h DESTINATION include/hello)