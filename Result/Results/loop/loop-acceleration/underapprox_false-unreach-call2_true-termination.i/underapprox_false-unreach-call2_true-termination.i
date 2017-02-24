>>> file_name='sv-benchmarks/loop-acceleration/underapprox_false-unreach-call2_t
rue-termination.i'
>>>
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 0;
  unsigned y = 1;
  while (x < 6)
  {
    x = x + 1;
    y = 2;
  }

  _1_PROVE = x != 6;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:unsigned x:unsigned _1_PROVE:int RET:int}
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
(= y1 2)
(= x1 (+ _N1 0))
(= main 0)

3. Other axioms:
(>= _N1 (+ (- 0) 6))
(implies (< _n1 _N1) (< (+ _n1 0) 6))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = 2
x1 = (_N1+0)
main = 0

3. Other axioms:
(_N1>=(-(0)+6))
(_n1<_N1) -> ((_n1+0)<6)

4. Assumption :

5. Assertion :
((_N1+0)!=6)
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

Assertion To Prove:(_N1!=6)
Counter Example
[y1 = 2, _N1 = 6, x1 = 6, main = 0, _f = [else -> Var(0)]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0