>>> file_name='sv-benchmarks/loop-lit/cggmp2005_true-unreach-call-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int i;
  int j;
  i = 1;
  j = 10;
  while (j >= i)
  {
    i = i + 2;
    j = (-1) + j;
  }

  _1_PROVE = j == 6;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int _1_PROVE:int RET:int j:int}
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
(= i1 (+ (* 2 _N1) 1))
(= j1 (j2 _N1))
(= main 0)

3. Other axioms:
(= (j2 (+ _n1 1)) (+ (- 1) (j2 _n1)))
(= (j2 0) 10)
(< (j2 _N1) (+ (* 2 _N1) 1))
(implies (< _n1 _N1) (>= (j2 _n1) (+ (* 2 _n1) 1)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = ((2*_N1)+1)
j1 = j2(_N1)
main = 0

3. Other axioms:
j2((_n1+1)) = (-(1)+j2(_n1))
j2(0) = 10
(j2(_N1)<((2*_N1)+1))
(_n1<_N1) -> (j2(_n1)>=((2*_n1)+1))

4. Assumption :

5. Assertion :
(j2(_N1)==6)
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

Assertion To Prove:(j2(_N1)==6)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0