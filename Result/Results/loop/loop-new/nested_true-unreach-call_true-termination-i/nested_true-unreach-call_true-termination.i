>>> file_name='sv-benchmarks/loop-new/nested_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _2_ASSUME = 0;
  int _1_PROVE = 0;
  int n = __VERIFIER_nondet_int();
  int m = __VERIFIER_nondet_int();
  int k = 0;
  int i;
  int j;
  _1_ASSUME = (10 <= n) && (n <= 10000);
  _2_ASSUME = (10 <= m) && (m <= 10000);
  i = 0;
  while (i < n)
  {
    j = 0;
    while (j < m)
    {
      k = k + 1;
      j = j + 1;
    }

    i = i + 1;
  }

  _1_PROVE = k >= 100;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ j:int i:int k:int _1_PROVE:int m:int RET:int n:int _2_ASSUME:int _1_ASSUME:int
}
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
(= i1 (+ _N2 0))
(= k1 (k5 _N2))
(= j1 (j5 _N2))
(= m1 __VERIFIER_nondet_int)
(= main 0)
(= n1 __VERIFIER_nondet_int)

3. Other axioms:
(>= (_N1 _n2) (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n1 (_N1 _n2)) (< (+ _n1 0) __VERIFIER_nondet_int))
(= (k5 (+ _n2 1)) (+ (_N1 _n2) (k5 _n2)))
(= (j5 (+ _n2 1)) (+ (_N1 _n2) 0))
(= (k5 0) 0)
(= (j5 0) j)
(>= _N2 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n2 _N2) (< (+ _n2 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N2+0)
k1 = k5(_N2)
j1 = j5(_N2)
m1 = __VERIFIER_nondet_int
main = 0
n1 = __VERIFIER_nondet_int

3. Other axioms:
(_N1(_n2)>=(-(0)+__VERIFIER_nondet_int))
(_n1<_N1(_n2)) -> ((_n1+0)<__VERIFIER_nondet_int)
k5((_n2+1)) = (_N1(_n2)+k5(_n2))
j5((_n2+1)) = (_N1(_n2)+0)
k5(0) = 0
j5(0) = j
(_N2>=(-(0)+__VERIFIER_nondet_int))
(_n2<_N2) -> ((_n2+0)<__VERIFIER_nondet_int)

4. Assumption :
((10<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=10000))
((10<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=10000))

5. Assertion :
(k5(_N2)>=100)
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

Assertion To Prove:k5(_N2) >= 100
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0