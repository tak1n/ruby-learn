#include <ruby.h>

VALUE object_first_ext_call(VALUE rb_self) {
  printf("C extension call\n");
}

void Init_libmygem() {
  // Define method Object#first_cext_call, corresponding to our C function object_first_cext_call; it has 0 argument.
  ID sym_mymodule = rb_intern("Mygem");
  VALUE mymodule = rb_const_get(rb_cObject, sym_mymodule);
  VALUE myextlib = rb_define_class_under(mymodule, "Myextlib", rb_cObject);
  rb_define_method(myextlib, "first_ext_call", object_first_ext_call, 0);
}
