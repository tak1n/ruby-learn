#include <ruby.h>
#include <iostream>

typedef VALUE (ruby_method_vararg)(...); // Needed for Conversion of C++ and C Type

int fibonacci() {
  int n, first = 0, second = 1, next, c;
  printf("Enter the number of terms\n");
  scanf("%d",&n);
 
  printf("First %d terms of Fibonacci series are :-\n",n);
 
  for ( c = 0 ; c < n ; c++ ) {
    if ( c <= 1 )
      next = c;
    else {
     next = first + second;
     first = second;
     second = next;
    }
    
    std::cout << next;
  }

  return 0;
}

class Class {
  public:
    int a;
    int b;
};

/** extern "C" "communicates" with ruby - basic programming structure of C++ Extensions (C++ Part -> extern "C" Part -> ruby) */
extern "C" { // extern C for methods interfacing with Ruby (prevent C++ Name Mangling on overloaded functions)
	void Init_cpppart() {

    rb_define_class("TestClass", rb_cObject);
	  // Define method Object#first_cext_call, corresponding to our C function object_first_cext_call; it has 0 argument.
	  std::cout << "Hello from CPP Land\n";
	  rb_define_method(rb_cObject, "fibonacci", (ruby_method_vararg *) fibonacci, 0);
	}
}