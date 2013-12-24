#include <ruby.h>

VALUE object_second_cext_call(VALUE rb_self) {
  printf("Second C extension call\n");
}
 
void Init_mysecondcext() {
  // Define method Object#second_cext_call, corresponding to our C function object_second_cext_call; it has 0 argument. 
  rb_define_method(rb_cObject, "second_cext_call", object_second_cext_call, 0);

}
