>>> file_name='sv-benchmarks/loop-acceleration/nested_true-unreach-call1.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 0;
  unsigned y = 0;
  while (x < 268435455)
  {
    y = 0;
    while (y < 10)
    {
      y = y + 1;
    }

    x = x + 1;
  }

  _1_PROVE = (x % 2) > 0;
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
(= y1 (y4 _N2))
(= x1 (+ _N2 0))
(= main 0)

3. Other axioms:
(>= (_N1 _n2) (+ (- 0) 10))
(implies (< _n1 (_N1 _n2)) (< (+ _n1 0) 10))
(= (y4 (+ _n2 1)) (+ (_N1 _n2) 0))
(= (y4 0) 0)
(>= _N2 (+ (- 0) 268435455))
(implies (< _n2 _N2) (< (+ _n2 0) 268435455))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = y4(_N2)
x1 = (_N2+0)
main = 0

3. Other axioms:
(_N1(_n2)>=(-(0)+10))
(_n1<_N1(_n2)) -> ((_n1+0)<10)
y4((_n2+1)) = (_N1(_n2)+0)
y4(0) = 0
(_N2>=(-(0)+268435455))
(_n2<_N2) -> ((_n2+0)<268435455)

4. Assumption :

5. Assertion :
(((_N2+0)%2)>0)
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

Assertion To Prove:((_N2%2)>0)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0