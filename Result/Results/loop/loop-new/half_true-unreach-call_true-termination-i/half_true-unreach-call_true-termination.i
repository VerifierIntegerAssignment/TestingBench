>>> file_name='sv-benchmarks/loop-new/half_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int i = 0;
  int n = 0;
  int k = __VERIFIER_nondet_int();
  _1_ASSUME = (k <= 1000000) && (k >= (-1000000));
  i = 0;
  while (i < (2 * k))
  {
    if ((i % 2) == 0)
    {
      n = n + 1;
    }

    i = i + 1;
  }

  _1_PROVE = (k < 0) || (n == k);
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int k:int _1_PROVE:int RET:int n:int _1_ASSUME:int}
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
(= i1 (+ _N1 0))
(= k1 __VERIFIER_nondet_int)
(= main 0)
(= n1 (n3 _N1))

3. Other axioms:
(= (n3 (+ _n1 1)) (ite (== (% (+ _n1 0) 2) 0) (+ (n3 _n1) 1) (n3 _n1)))
(= (n3 0) 0)
(>= _N1 (+ (- 0) (* 2 __VERIFIER_nondet_int)))
(implies (< _n1 _N1) (< (+ _n1 0) (* 2 __VERIFIER_nondet_int)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N1+0)
k1 = __VERIFIER_nondet_int
main = 0
n1 = n3(_N1)

3. Other axioms:
n3((_n1+1)) = ite((((_n1+0)%2)==0),(n3(_n1)+1),n3(_n1))
n3(0) = 0
(_N1>=(-(0)+(2*__VERIFIER_nondet_int)))
(_n1<_N1) -> ((_n1+0)<(2*__VERIFIER_nondet_int))

4. Assumption :
((__VERIFIER_nondet_int<=1000000) and (__VERIFIER_nondet_int>=-(1000000)))

5. Assertion :
((__VERIFIER_nondet_int<0) or (n3(_N1)==__VERIFIER_nondet_int))
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

Assertion To Prove:Or(__VERIFIER_nondet_int < 0,(n3(_N1)==__VERIFIER_nondet_int)
)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
1