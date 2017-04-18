# Adding clang-tidy target if executable is found
find_program(CLANG_TIDY "clang-tidy")
if(CLANG_TIDY)
  add_custom_target(
    tidy
    ALL
    COMMAND /usr/bin/clang-tidy
    ${fsrc}
    -config=''
    -warnings-as-errors=*
    --
    -std=c++11
    ${INCLUDE_DIRECTORIES}
    )
endif()