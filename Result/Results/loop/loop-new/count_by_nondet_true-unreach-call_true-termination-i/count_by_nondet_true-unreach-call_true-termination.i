>>> file_name='sv-benchmarks/loop-new/count_by_nondet_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int i = 0;
  int k = 0;
  int j;
  while (i < 1000000)
  {
    j = __VERIFIER_nondet_int();
    _1_ASSUME[i] = (1 <= j) && (j < 1000000);
    i = i + j;
    k = k + 1;
  }

  _1_PROVE = k <= 1000000;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ j:int i:int k:int _1_PROVE:int RET:int _1_ASSUME:int}
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
(= i1 (+ (* __VERIFIER_nondet_int _N1) 0))
(= k1 (+ _N1 0))
(= j1 __VERIFIER_nondet_int)
(= main 0)

3. Other axioms:
(>= _N1 (/ (+ (- 0) 1000000) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ (* __VERIFIER_nondet_int _n1) 0) 1000000))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = ((__VERIFIER_nondet_int*_N1)+0)
k1 = (_N1+0)
j1 = __VERIFIER_nondet_int
main = 0

3. Other axioms:
(_N1>=((-(0)+1000000)/__VERIFIER_nondet_int))
(_n1<_N1) -> (((__VERIFIER_nondet_int*_n1)+0)<1000000)

4. Assumption :

5. Assertion :
((_N1+0)<=1000000)
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

Assertion To Prove:_N1 <= 1000000
Counter Example
[__VERIFIER_nondet_int = -1,
 i1 = -1000001,
 k1 = 1000001,
 _N1 = 1000001,
 j1 = -1,
 main = 0,
 _f = [else -> Var(0)]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0