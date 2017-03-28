# Adding clang-tidy target if executable is found
find_program(CPPCHECK "cppcheck")
if(CPPCHECK)
  add_custom_target(
    check
    COMMAND /usr/bin/cppcheck
    --error-exitcode=1
    ${fsrc}
    ${INCLUDE_DIRECTORIES}
    )
endif()