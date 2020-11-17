#include <stdio.h>
#include <stdint.h>
#include <caml/mlvalues.h>
#include <caml/alloc.h>

typedef union {
  int32_t i;
  float f;
} flt;

value ftoi(value v) {
  flt f;
  f.f = (float)Double_val(v);
  return copy_int32(f.i);
}

value itof(value v) {
    flt i;
    i.i = Int32_val(v);
    return copy_double(i.f);
}
