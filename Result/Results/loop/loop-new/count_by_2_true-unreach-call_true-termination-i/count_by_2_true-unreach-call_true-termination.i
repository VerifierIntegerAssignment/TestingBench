>>> file_name='sv-benchmarks/loop-new/count_by_2_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int i;
  i = 0;
  while (i < 1000000)
  {
    i = i + 2;
  }

  _1_PROVE = i == 1000000;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int _1_PROVE:int RET:int}
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
(= i1 (+ (* 2 _N1) 0))
(= main 0)

3. Other axioms:
(>= _N1 (+ (/ (- 0) 2) 500000))
(implies (< _n1 _N1) (< (+ (* 2 _n1) 0) 1000000))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = ((2*_N1)+0)
main = 0

3. Other axioms:
(_N1>=((-(0)/2)+500000))
(_n1<_N1) -> (((2*_n1)+0)<1000000)

4. Assumption :

5. Assertion :
(((2*_N1)+0)==1000000)
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

Assertion To Prove:(2*_N1==1000000)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0