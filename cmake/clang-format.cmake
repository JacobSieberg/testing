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