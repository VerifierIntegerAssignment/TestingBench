extern void __VERIFIER_error(void);
extern void __VERIFIER_assume(int);
void __VERIFIER_assert(int cond) {
  if (!(cond)) {
      ERROR: __VERIFIER_error();
  }
  return;
}
int __VERIFIER_nondet_int();
int main() {
    int i, j;
    int x;
    int y;
    i = __VERIFIER_nondet_int();
    j = __VERIFIER_nondet_int();
    y = j;
    x = i;
     __VERIFIER_assume(i >= 0 && j >= 0);
    while(x != 0) {
        x--;
        y--;
    }
    if (i == j) {
        __VERIFIER_assert(y == 0);
    }
    return 0;
}