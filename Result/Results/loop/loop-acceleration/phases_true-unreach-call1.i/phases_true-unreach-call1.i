>>> file_name='sv-benchmarks/loop-acceleration/phases_true-unreach-call1.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 0;
  while (x < 268435455)
  {
    if (x < 65520)
    {
      x = x + 1;
    }
    else
    {
      x = x + 2;
    }

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
(= x1 (x3 _N1))
(= main 0)

3. Other axioms:
(= (x3 (+ _n1 1)) (ite (< (x3 _n1) 65520) (+ (x3 _n1) 1) (+ (x3 _n1) 2)))
(= (x3 0) 0)
(>= 0 (+ (- (x3 _N1)) 268435455))
(implies (< _n1 _N1) (< (x3 _n1) 268435455))

Output in normal notation:
1. Frame axioms:

2. Output equations:
x1 = x3(_N1)
main = 0

3. Other axioms:
x3((_n1+1)) = ite((x3(_n1)<65520),(x3(_n1)+1),(x3(_n1)+2))
x3(0) = 0
(0>=(-(x3(_N1))+268435455))
(_n1<_N1) -> (x3(_n1)<268435455)

4. Assumption :

5. Assertion :
((x3(_N1)%2)<=0)
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

Assertion To Prove:((x3(_N1)%2)<=0)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0