#!/bin/bash

function system_libs_info() {
    unset KRB5CCNAME
    reset
    
    echo "clang-format:"
    clang-format --version
    echo

    echo "cppcheck:"
    cppcheck --version
    echo

    echo "valgrind:"
    valgrind --version
    echo
}