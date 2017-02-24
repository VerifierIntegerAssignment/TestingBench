>>> file_name='sv-benchmarks/loop-invgen/up_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE[];
  int n;
  int i = 0;
  int k = 0;
  n = __VERIFIER_nondet_int();
  while (i < n)
  {
    i = i + 1;
    k = k + 1;
  }

  int j = 0;
  while (j < n)
  {
    _1_PROVE[j] = k > 0;
    j = j + 1;
    k = k - 1;
  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ j:int i:int k:int _1_PROVE:array RET:int n:int}
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
(= _1_PROVE1 _1_PROVE)

2. Output equations:
(= (d1array1 _x1 _x2) (d1array5 _x1 _x2 _N2))
(= i1 (+ _N1 0))
(= k1 (k5 _N2))
(= j1 (+ _N2 0))
(= main 0)
(= n1 __VERIFIER_nondet_int)

3. Other axioms:
(>= _N1 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ _n1 0) __VERIFIER_nondet_int))
(= (k5 (+ _n2 1)) (- (k5 _n2) 1))
(= (k5 0) (+ _N1 0))
(= (d1array5 _x1 _x2 0) (d1array _x1 _x2))
(>= _N2 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n2 _N2) (< (+ _n2 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE

2. Output equations:
d1array1(_x1,_x2) = d1array5(_x1,_x2,_N2)
i1 = (_N1+0)
k1 = k5(_N2)
j1 = (_N2+0)
main = 0
n1 = __VERIFIER_nondet_int

3. Other axioms:
(_N1>=(-(0)+__VERIFIER_nondet_int))
(_n1<_N1) -> ((_n1+0)<__VERIFIER_nondet_int)
k5((_n2+1)) = (k5(_n2)-1)
k5(0) = (_N1+0)
d1array5(_x1,_x2,0) = d1array(_x1,_x2)
(_N2>=(-(0)+__VERIFIER_nondet_int))
(_n2<_N2) -> ((_n2+0)<__VERIFIER_nondet_int)

4. Assumption :

5. Assertion :
(k5(_n2)>0)
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

Assertion To Prove:ForAll([_n2],k5(_n2) > 0)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0