>>> file_name='sv-benchmarks/loops/sum03_true-unreach-call_false-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned sn = 0;
  unsigned loop1_var = __VERIFIER_nondet_uint();
  unsigned n1_var = __VERIFIER_nondet_uint();
  unsigned x = 0;
  while (1 > 0)
  {
    sn = sn + 2;
    x = x + 1;
    _1_PROVE = (sn == (x * 2)) || (sn == 0);
  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ _1_PROVE:int loop1_var:unsigned n1_var:unsigned RET:int sn:unsigned x:unsigned
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
(= loop1_var1 __VERIFIER_nondet_uint)
(= x1 (+ _N1 0))
(= n1_var1 __VERIFIER_nondet_uint)
(= sn1 (+ (* 2 _N1) 0))
(= main 0)

3. Other axioms:
(<= 1 0)
(implies (< _n1 _N1) (> 1 0))

Output in normal notation:
1. Frame axioms:

2. Output equations:
loop1_var1 = __VERIFIER_nondet_uint
x1 = (_N1+0)
n1_var1 = __VERIFIER_nondet_uint
sn1 = ((2*_N1)+0)
main = 0

3. Other axioms:
(1<=0)
(_n1<_N1) -> (1>0)

4. Assumption :

5. Assertion :
((((2*_n1)+0)+2)==0)
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

Assertion To Prove:ForAll([_n1],(2*_n1 + 2==0))
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0