#include <ruby.h>
#include <iostream>
 
extern "C" {

	void Init_cpppart() {
	  // Define method Object#first_cext_call, corresponding to our C function object_first_cext_call; it has 0 argument.
	  printf("Hello from extern C");
	}
}