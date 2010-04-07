// file 1.c
// let us study C-language

#include <stdio.h>


typedef struct {
  int a;
  int b[2];
  int c;
} S;

// --------------------------------------------------------------------------------

void example_1( void) {

  S s1, s2;
    
  s1.a =   1;
  s1.b[0] =  10;
  s1.b[1] =  11;
  s1.c = 100;

  s2.a =   2;
  s2.b[0] =  20;
  s2.b[1] =  21;
  s2.c = 200;

  printf( "%d %d %d %d\n", s1.a, s1.b[0], s1.b[1], s1.c);
  printf( "%d %d %d %d\n", s2.a, s2.b[0], s2.b[1], s2.c);
  
  s2 = s1;
  
  printf( "%d %d %d %d\n", s1.a, s1.b[0], s1.b[1], s1.c);
  printf( "%d %d %d %d\n", s2.a, s2.b[0], s2.b[1], s2.c);
  
}

// --------------------------------------------------------------------------------

S func( void) {
  S s;
  s.a = 123;
  s.b[0] = 456;
  s.b[1] = 789;
  s.c = 321;
  return s;
}

// --------------------------------------------------------------------------------

void example_2( void) {
  S ss;
  ss = func();
  printf( "==>  %d %d %d %d\n", ss.a, ss.b[0], ss.b[1], ss.c);
}

// --------------------------------------------------------------------------------

void main (void) {
  example_1();
  example_2();
}
// --------------------------------------------------------------------------------
