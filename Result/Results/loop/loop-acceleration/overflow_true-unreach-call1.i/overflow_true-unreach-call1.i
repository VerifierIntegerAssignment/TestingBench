>>> file_name='sv-benchmarks/loop-acceleration/overflow_true-unreach-call1.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 10;
  while (x >= 10)
  {
    x = x + 2;
  }

  _1_PROVE = (x % 2) <= 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ x:unsigned _1_PROVE:int RET:int}
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
(= x1 (+ (* 2 _N1) 10))
(= main 0)

3. Other axioms:
(< (+ (* 2 _N1) 10) 10)
(implies (< _n1 _N1) (>= (+ (* 2 _n1) 10) 10))

Output in normal notation:
1. Frame axioms:

2. Output equations:
x1 = ((2*_N1)+10)
main = 0

3. Other axioms:
(((2*_N1)+10)<10)
(_n1<_N1) -> (((2*_n1)+10)>=10)

4. Assumption :

5. Assertion :
((((2*_N1)+10)%2)<=0)
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

Assertion To Prove:((2*_N1 + 10%2)<=0)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0