>>> prove_auto('sv-benchmarks/loop-lit/afnp2014_true-unreach-call-i.c')
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int x = 1;
  int y = 0;
  while ((y < 1000) && (__VERIFIER_nondet_int() > 0))
  {
    x = x + y;
    y = y + 1;
  }

  _1_PROVE = x >= y;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:int x:int _1_PROVE:int RET:int}
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
(= x1 (/ (+ (- (+ (** _N1 2) (* (* 2 _N1) 0)) _N1) (* 2 1)) 2))
(= main 0)

3. Other axioms:
(or (>= (+ _N1 0) 1000) (<= __VERIFIER_nondet_int 0))
(implies (< _n1 _N1) (and (< (+ _n1 0) 1000) (> __VERIFIER_nondet_int 0)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = (_N1+0)
x1 = (((((_N1**2)+((2*_N1)*0))-_N1)+(2*1))/2)
main = 0

3. Other axioms:
(((_N1+0)>=1000) or (__VERIFIER_nondet_int<=0))
(_n1<_N1) -> (((_n1+0)<1000) and (__VERIFIER_nondet_int>0))

4. Assumption :

5. Assertion :
((((((_N1**2)+((2*_N1)*0))-_N1)+(2*1))/2)>=(_N1+0))
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

Assertion To Prove:((-_N1 + _N1*_N1 + 2/2)>=_N1)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0