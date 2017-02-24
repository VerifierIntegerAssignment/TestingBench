>>> file_name='sv-benchmarks/loop-acceleration/functions_true-unreach-call1_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int f2_1_RET = 0;
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x = 0;
  while (x < 268435455)
  {
    f2_1_RET = 0;
    f2_1_RET = x + 2;
    x = f2_1_result;
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
{ f2_1_RET:int x:unsigned _1_PROVE:int RET:int}
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
Program Body
{
  int RET = 0;
  RET = z + 2;
}

Function Name:
f
Return Type:
unsigned
Input Variables:
{ z:unsigned}
Local Variables:
{ RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:

2. Output equations:
(= f2_1_RET1 (+ f2_1_result 2))
(= x1 f2_1_result)
(= main 0)

3. Other axioms:
(>= f2_1_result 268435455)
(implies (< _n1 _N1) (< f2_1_result 268435455))

Output in normal notation:
1. Frame axioms:

2. Output equations:
f2_1_RET1 = (f2_1_result+2)
x1 = f2_1_result
main = 0

3. Other axioms:
(f2_1_result>=268435455)
(_n1<_N1) -> (f2_1_result<268435455)

4. Assumption :

5. Assertion :
((f2_1_result%2)<=0)
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
Output for f:
Output in prefix notation:
1. Frame axioms:
(= (z1 z) z)

2. Output equations:
(= (f z) (+ z 2))

3. Other axioms:

Output in normal notation:
1. Frame axioms:
z1(z) = z

2. Output equations:
f(z) = (z+2)

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:((f2_1_result%2)<=0)
Counter Example
[f2_1_RET1 = 268435457,
 f2_1_result = 268435455,
 _N1 = 0,
 x1 = 268435455,
 main = 0,
 _f = [else -> Var(0)]]


Function Name--__VERIFIER_assert
No Assertion to Prove

Function Name--f
No Assertion to Prove
1