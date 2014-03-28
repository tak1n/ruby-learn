import std.stdio;

extern (C) {
  int hellomath(int a, int b) {
    writeln("Hello from D Land");
    return a + b;
  }
}
