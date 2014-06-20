#include <ruby.h>
 
VALUE needs(VALUE rb_self) {
  return rb_str_new2("brains");
}
 
void Init_combie() {
  VALUE cCombie = rb_define_class("Combie", rb_cObject);
  rb_define_method(cCombie, "needs", needs, 0);
}
