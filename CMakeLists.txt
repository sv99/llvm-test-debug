cmake_minimum_required(VERSION 3.23)

# set(CMAKE_C_SOURCE_FILE_EXTENSIONS c;m;ll)

project(llvm_test_debug C ASM)

set(CMAKE_C_COMPILER /Users/svolkov/work/llvm/llvm-project/build-debug15/bin/clang)

add_executable(raise-cmovle raise-cmovle.S)

add_custom_target(raise-cmovle-dis
    COMMAND ${CMAKE_C_COMPILER} -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk -o raise-cmovle-dis ../raise-cmovle-tmp-dis.ll
)

add_executable(raise-cmovle-ll raise-cmov.c.ll)
set_target_properties(raise-cmovle-ll PROPERTIES LINKER_LANGUAGE C)

add_executable(raise-cmov raise-cmov.c)
