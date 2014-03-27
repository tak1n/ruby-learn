#include <stdlib.h>
#include <stdint.h>
#include <math.h>

int prime(register int n)
{

  if (n == 2)
    return 1;
  if ((n & 1) == 0)
    return 0;

  register uint64_t sqrt_n = ((uint64_t)sqrt(n)) + 1;
  register uint64_t i=3;
  for (i; i<= sqrt_n; i+=2) {
    if (n % i == 0)
      return 0;
  }
  return 1;
}
