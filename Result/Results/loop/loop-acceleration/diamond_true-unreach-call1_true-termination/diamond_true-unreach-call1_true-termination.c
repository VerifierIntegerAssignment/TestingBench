>>> file_name='sv-benchmarks/loop-acceleration/diamond_true-unreach-call1_true-termination.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 0;
  unsigned y = __VERIFIER_nondet_uint();
  while (x < 99)
  {
    if ((y % 2) == 0)
    {
      x = x + 2;
    }
    else
    {
      x = x + 1;
    }

  }

  _1_PROVE = (x % 2) == (y % 2);
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
(= y1 __VERIFIER_nondet_uint)
(= x1 (x3 _N1))
(= main 0)

3. Other axioms:
(= (x3 (+ _n1 1)) (ite (== (% __VERIFIER_nondet_uint 2) 0) (+ (x3 _n1) 2) (+ (x3
 _n1) 1)))
(= (x3 0) 0)
(>= 0 (+ (- (x3 _N1)) 99))
(implies (< _n1 _N1) (< (x3 _n1) 99))

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = __VERIFIER_nondet_uint
x1 = x3(_N1)
main = 0

3. Other axioms:
x3((_n1+1)) = ite(((__VERIFIER_nondet_uint%2)==0),(x3(_n1)+2),(x3(_n1)+1))
x3(0) = 0
(0>=(-(x3(_N1))+99))
(_n1<_N1) -> (x3(_n1)<99)

4. Assumption :

5. Assertion :
((x3(_N1)%2)==(__VERIFIER_nondet_uint%2))
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

Assertion To Prove:((x3(_N1)%2)==(__VERIFIER_nondet_uint%2))
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
1