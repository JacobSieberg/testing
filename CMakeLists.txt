cmake_minimum_required(VERSION 2.8.9)
project (hello)

set(src "main.cpp")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

Include(cmake/makefullfilenames.cmake)
Include(cmake/clang-format.cmake)
Include(cmake/clang-tidy-check.cmake)
Include(cmake/cppcheck.cmake)

add_executable(hello ${src})