>>> file_name='sv-benchmarks/loops/sum01_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int i;
  int n = __VERIFIER_nondet_int();
  int sn = 0;
  _1_ASSUME = (n < 1000) && (n >= (-1000));
  i = 1;
  while (i <= n)
  {
    sn = sn + 2;
    i = i + 1;
  }

  _1_PROVE = (sn == (n * 2)) || (sn == 0);
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int _1_PROVE:int RET:int n:int sn:int _1_ASSUME:int}
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
(= i1 (+ _N1 1))
(= sn1 (+ (* 2 _N1) 0))
(= main 0)
(= n1 __VERIFIER_nondet_int)

3. Other axioms:
(> (+ _N1 1) __VERIFIER_nondet_int)
(implies (< _n1 _N1) (<= (+ _n1 1) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N1+1)
sn1 = ((2*_N1)+0)
main = 0
n1 = __VERIFIER_nondet_int

3. Other axioms:
((_N1+1)>__VERIFIER_nondet_int)
(_n1<_N1) -> ((_n1+1)<=__VERIFIER_nondet_int)

4. Assumption :
((__VERIFIER_nondet_int<1000) and (__VERIFIER_nondet_int>=-(1000)))

5. Assertion :
((((2*_N1)+0)==(__VERIFIER_nondet_int*2)) or (((2*_N1)+0)==0))
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

Assertion To Prove:Or((2*_N1==2*__VERIFIER_nondet_int),(2*_N1==0))
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
2