>>> file_name='sv-benchmarks/loops/nec40_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int i;
  int k;
  int j;
  int RET = 0;
  int _1_PROVE = 0;
  k = __VERIFIER_nondet_int();
  i = 0;
  while (x[i] != 0)
  {
    y[i] = x[i];
    i = i + 1;
  }

  y[i] = 0;
  if ((k >= 0) && (k < i))
  {
    if (y[k] != 0)
    {
      _1_PROVE = 0 > 0;
    }

  }

  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int k:int j:int _1_PROVE:int RET:int}
Program Body
{
  int i;
  int k;
  int j;
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
{ i:int _1_FAILED:int k:int j:int RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:
(= j1 j)

2. Output equations:
(= i1 (+ _N1 0))
(= k1 __VERIFIER_nondet_int)
(= main 0)

3. Other axioms:
(== (d1array x (+ _N1 0)) 0)
(implies (< _n1 _N1) (!= (d1array x (+ _n1 0)) 0))

Output in normal notation:
1. Frame axioms:
j1 = j

2. Output equations:
i1 = (_N1+0)
k1 = __VERIFIER_nondet_int
main = 0

3. Other axioms:
(d1array(x,(_N1+0))==0)
(_n1<_N1) -> (d1array(x,(_n1+0))!=0)

4. Assumption :

5. Assertion :
ite(((__VERIFIER_nondet_int>=0) and (__VERIFIER_nondet_int<(_N1+0))),ite((d1arra
y(y,__VERIFIER_nondet_int)!=0),(0>0),0),0)
Output for __VERIFIER_assert:
Output in prefix notation:
1. Frame axioms:
(= i1 i)
(= k1 k)
(= j1 j)
(= (cond1 cond) cond)

2. Output equations:
(= (_1_FAILED1 cond) (ite (<= cond 0) 1 0))
(= (__VERIFIER_assert cond) 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:
i1 = i
k1 = k
j1 = j
cond1(cond) = cond

2. Output equations:
_1_FAILED1(cond) = ite((cond<=0),1,0)
__VERIFIER_assert(cond) = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:Implies(And(__VERIFIER_nondet_int >= 0,__VERIFIER_nondet_int
< _N1),Implies(d1array(y, __VERIFIER_nondet_int)!=0,0>0))
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0