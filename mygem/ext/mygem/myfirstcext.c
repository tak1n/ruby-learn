#include <ruby.h>
 
static VALUE object_first_cext_call(VALUE rb_self) {
  printf("First C extension call\n");
}
 
void Init_myfirstcext() {
  // Define method Object#first_cext_call, corresponding to our C function object_first_cext_call; it has 0 argument.
  rb_define_method(rb_cObject, "first_cext_call", object_first_cext_call, 0);
}
