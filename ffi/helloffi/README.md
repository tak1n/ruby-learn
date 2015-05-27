# Generated Dynamic libs to use with ffi

## C

`clang -o libhello.so -fPIC -shared hello.c`

## C++

`clang -o libhellopp.so -fPIC -shared hello.cpp`

## Rust

`rustc -o libhellorust.so --crate-type dylib hello.rs`
