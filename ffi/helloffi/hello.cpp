#include <iostream>

extern "C" {
  int hellomath(int a, int b) {
    std::cout << "Hello from CPP Land";
    return a + b;
  }
}
