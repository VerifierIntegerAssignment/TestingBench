extern void __VERIFIER_error() __attribute__ ((__noreturn__));
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: __VERIFIER_error(); } }
int main( ) {
  int n= __VERIFIER_nondet_int();
  int A[n];
  int i;
  for (i = 0; i < n/2 ; i++ ) {
    A[i] = A[n -i-1];
  }
  int x;
  for ( x = 0 ; x < n/2 ; x++ ) {
    __VERIFIER_assert( A[x] == A[n - x - 1] );
  }
  return 0;
}
