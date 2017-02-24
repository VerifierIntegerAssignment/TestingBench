>>> file_name='sv-benchmarks/loops/terminator_02_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  while ((x < 100) && (100 < z))
  {
    _Bool tmp = __VERIFIER_nondet_bool();
    if (tmp > 0)
    {
      x = x + 1;
    }
    else
    {
      x = x - 1;
      z = z - 1;
    }

  }

  _1_PROVE = 0 > 0;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ tmp:_Bool _1_PROVE:int RET:int y:int x:int z:int}
Program Body
{
  int RET = 0;
  int _1_FAILED = 0;
  if (cond <= 0)
  {
    ERROR:


    _1_FAILED = 1;
  }

}

Function Name:
__VERIFIER_assert
Return Type:
void
Input Variables:
{ cond:int}
Local Variables:
{ _1_FAILED:int RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:

2. Output equations:
(= tmp1 __VERIFIER_nondet_bool)
(= y1 __VERIFIER_nondet_int)
(= z1 (z4 _N1))
(= main 0)
(= x1 (x4 _N1))

3. Other axioms:
(= (x4 (+ _n1 1)) (ite (> __VERIFIER_nondet_bool 0) (+ (x4 _n1) 1) (- (x4 _n1) 1
)))
(= (z4 (+ _n1 1)) (ite (> __VERIFIER_nondet_bool 0) (z4 _n1) (- (z4 _n1) 1)))
(= (x4 0) __VERIFIER_nondet_int)
(= (z4 0) __VERIFIER_nondet_int)
(or (>= (x4 _N1) 100) (>= 100 (z4 _N1)))
(implies (< _n1 _N1) (and (< (x4 _n1) 100) (< 100 (z4 _n1))))

Output in normal notation:
1. Frame axioms:

2. Output equations:
tmp1 = __VERIFIER_nondet_bool
y1 = __VERIFIER_nondet_int
z1 = z4(_N1)
main = 0
x1 = x4(_N1)

3. Other axioms:
x4((_n1+1)) = ite((__VERIFIER_nondet_bool>0),(x4(_n1)+1),(x4(_n1)-1))
z4((_n1+1)) = ite((__VERIFIER_nondet_bool>0),z4(_n1),(z4(_n1)-1))
x4(0) = __VERIFIER_nondet_int
z4(0) = __VERIFIER_nondet_int
((x4(_N1)>=100) or (100>=z4(_N1)))
(_n1<_N1) -> ((x4(_n1)<100) and (100<z4(_n1)))

4. Assumption :

5. Assertion :
(0>0)
Output for __VERIFIER_assert:
Output in prefix notation:
1. Frame axioms:
(= (cond1 cond) cond)

2. Output equations:
(= (_1_FAILED1 cond) (ite (<= cond 0) 1 0))
(= (__VERIFIER_assert cond) 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:
cond1(cond) = cond

2. Output equations:
_1_FAILED1(cond) = ite((cond<=0),1,0)
__VERIFIER_assert(cond) = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:(0>0)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0