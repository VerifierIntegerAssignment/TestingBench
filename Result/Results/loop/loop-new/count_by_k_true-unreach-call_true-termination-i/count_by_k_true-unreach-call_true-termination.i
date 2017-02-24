>>> file_name='sv-benchmarks/loop-new/count_by_k_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int i;
  int k;
  k = __VERIFIER_nondet_int();
  _1_ASSUME = (0 <= k) && (k <= 10);
  i = 0;
  while (i < (1000000 * k))
  {
    i = i + k;
  }

  _1_PROVE = i == (1000000 * k);
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ _1_ASSUME:int i:int k:int _1_PROVE:int RET:int}
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
(= i1 (+ (* _N1 __VERIFIER_nondet_int) 0))
(= k1 __VERIFIER_nondet_int)
(= main 0)

3. Other axioms:
(>= _N1 (/ (+ (- 0) (* 1000000 __VERIFIER_nondet_int)) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ (* _n1 __VERIFIER_nondet_int) 0) (* 1000000 __VERIFIE
R_nondet_int)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = ((_N1*__VERIFIER_nondet_int)+0)
k1 = __VERIFIER_nondet_int
main = 0

3. Other axioms:
(_N1>=((-(0)+(1000000*__VERIFIER_nondet_int))/__VERIFIER_nondet_int))
(_n1<_N1) -> (((_n1*__VERIFIER_nondet_int)+0)<(1000000*__VERIFIER_nondet_int))

4. Assumption :
((0<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=10))

5. Assertion :
(((_N1*__VERIFIER_nondet_int)+0)==(1000000*__VERIFIER_nondet_int))
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

Assertion To Prove:(_N1*__VERIFIER_nondet_int==1000000*__VERIFIER_nondet_int)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0