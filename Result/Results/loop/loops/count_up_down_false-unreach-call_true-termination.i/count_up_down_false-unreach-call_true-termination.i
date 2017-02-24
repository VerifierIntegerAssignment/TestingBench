>>> file_name='sv-benchmarks/loops/count_up_down_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned n = __VERIFIER_nondet_uint();
  unsigned x = n;
  unsigned y = 0;
  while (x > 0)
  {
    x = x - 1;
    y = y + 1;
  }

  _1_PROVE = y != n;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:unsigned x:unsigned _1_PROVE:int RET:int n:unsigned}
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
(= y1 (+ _N1 0))
(= x1 (x2 _N1))
(= main 0)
(= n1 __VERIFIER_nondet_uint)

3. Other axioms:
(= (x2 (+ _n1 1)) (- (x2 _n1) 1))
(= (x2 0) n)
(<= 0 (- (x2 _N1)))
(implies (< _n1 _N1) (> (x2 _n1) 0))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = (_N1+0)
x1 = x2(_N1)
main = 0
n1 = __VERIFIER_nondet_uint

3. Other axioms:
x2((_n1+1)) = (x2(_n1)-1)
x2(0) = n
(0<=-(x2(_N1)))
(_n1<_N1) -> (x2(_n1)>0)

4. Assumption :

5. Assertion :
((_N1+0)!=__VERIFIER_nondet_uint)
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

Assertion To Prove:(_N1!=__VERIFIER_nondet_uint)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0