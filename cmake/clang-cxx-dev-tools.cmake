foreach(file ${src})
    Set(fsrc ${fsrc} ${CMAKE_CURRENT_SOURCE_DIR}/${file})
endforeach(file)

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
    COMMAND if /usr/bin/clang-tidy ${fsrc} -config='' -- -std=c++11 ${INCLUDE_DIRECTORIES} grep -q 'warnings'; then echo "Failure to the max." fi
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
    )
endif()