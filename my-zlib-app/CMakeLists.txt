cmake_minimum_required(VERSION 3.15)

project(my-zlib-app)

find_package(ZLIB REQUIRED)

add_executable(
		my-zlib-app 
		src/main.cpp
		src/compressor.cpp
)

target_link_libraries(
    my-zlib-app
    PRIVATE
    ZLIB::ZLIB
)

install(
    TARGETS my-zlib-app
    DESTINATION bin
)