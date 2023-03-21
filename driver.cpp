#include <stdio.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <stdint.h>
#include <iostream>

extern "C" double hypotenuse();

int main() {
  printf("Welcome to Pythagoras' Math Lab programmed by Priyanka Lee.\n");
  printf("Please contact me at priyankaaax3@csu.fullerton.edu if you need assistance.\n");
  double ret_hypot = hypotenuse();
  printf("The main file received this number %1.12lf and will keep it.\n", ret_hypot);
  printf("Zero will be returned to the system, have a good day.\n");

  return 0;
}
