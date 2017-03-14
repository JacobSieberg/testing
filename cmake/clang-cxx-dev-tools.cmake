foreach(file ${src})
    Set(fsrc ${fsrc} ${CMAKE_CURRENT_SOURCE_DIR}/${file})
endforeach(file)

file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/logs)

# Adding clang-format target if executable is found
find_program(CLANG_FORMAT "clang-format")
if(CLANG_FORMAT)
  add_custom_target(
    format
    ALL
    COMMAND /usr/bin/clang-format
    -i
    -style=file
    ${fsrc}
    )
endif()

# Adding clang-tidy target if executable is found
find_program(CLANG_TIDY "clang-tidy")
if(CLANG_TIDY)
  add_custom_target(
    tidy
    ALL
    COMMAND /usr/bin/clang-tidy
    ${fsrc}
    -config=''
    --
    -std=c++11
    ${INCLUDE_DIRECTORIES}
    | tee ${CMAKE_BINARY_DIR}/logs/tidy.txt
    )
endif()

# Adding clang-tidy target if executable is found
find_program(CPPCHECK "cppcheck")
if(CPPCHECK)
  add_custom_target(
    check
    ALL
    COMMAND /usr/bin/cppcheck
    ${fsrc}
    ${INCLUDE_DIRECTORIES}
    | tee ${CMAKE_BINARY_DIR}/logs/check.txt
    )
endif()