cmake_minimum_required(VERSION 2.8.9)
project (hello)

set(src "main.cpp")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

Include(cmake/clang-cxx-dev-tools.cmake)

add_executable(hello ${src})