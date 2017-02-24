>>> file_name='sv-benchmarks/loop-acceleration/phases_false-unreach-call2.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  unsigned x = 1;
  unsigned y = __VERIFIER_nondet_uint();
  _1_ASSUME = y > 0;
  while (x < y)
  {
    if (x < (y / x))
    {
      x = x;
    }
    else
    {
      x = x + 1;
    }

  }

  _1_PROVE = x != y;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ _1_ASSUME:int x:unsigned _1_PROVE:int y:unsigned RET:int}
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
(= y1 __VERIFIER_nondet_uint)
(= x1 (x3 _N1))
(= main 0)

3. Other axioms:
(= (x3 (+ _n1 1)) (ite (< (x3 _n1) (/ __VERIFIER_nondet_uint (x3 _n1))) (x3 _n1)
 (+ (x3 _n1) 1)))
(= (x3 0) 1)
(<= 0 (+ (- __VERIFIER_nondet_uint) (x3 _N1)))
(implies (< _n1 _N1) (< (x3 _n1) __VERIFIER_nondet_uint))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = __VERIFIER_nondet_uint
x1 = x3(_N1)
main = 0

3. Other axioms:
x3((_n1+1)) = ite((x3(_n1)<(__VERIFIER_nondet_uint/x3(_n1))),x3(_n1),(x3(_n1)+1)
)
x3(0) = 1
(0<=(-(__VERIFIER_nondet_uint)+x3(_N1)))
(_n1<_N1) -> (x3(_n1)<__VERIFIER_nondet_uint)

4. Assumption :
(__VERIFIER_nondet_uint>0)

5. Assertion :
(x3(_N1)!=__VERIFIER_nondet_uint)
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

Assertion To Prove:(x3(_N1)!=__VERIFIER_nondet_uint)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0