#include <iostream>
#include <ruby.h>

extern "C" VALUE object_second_cext_call(VALUE rb_self) {
  printf("Second C extension call\n");
}
 
extern "C" void Init_mysecondcext() {
  // Define method Object#second_cext_call, corresponding to our C function object_second_cext_call; it has 0 argument. 
  try {
  	rb_define_method(rb_cObject, "second_cext_call", object_second_cext_call, 0);
  	std::cout << "hi";
  } catch {
  	std::cout << "Exception occured";
  }
}
