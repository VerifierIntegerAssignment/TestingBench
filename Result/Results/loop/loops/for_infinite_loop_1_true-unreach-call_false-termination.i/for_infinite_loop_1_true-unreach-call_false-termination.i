>>> file_name='sv-benchmarks/loops/for_infinite_loop_1_true-unreach-call_false-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int _2_PROVE = 0;
  unsigned i = 0;
  int x = 0;
  int y = 0;
  int n = __VERIFIER_nondet_int();
  _1_ASSUME = n > 0;
  i = 0;
  while (1 > 0)
  {
    _1_PROVE = x == 0;
    i = i + 1;
  }

  _2_PROVE = x == 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:unsigned _1_PROVE:int RET:int n:int y:int _1_ASSUME:int x:int _2_PROVE:int}
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
(= y1 0)
(= x1 0)
(= main 0)
(= n1 __VERIFIER_nondet_int)

3. Other axioms:
(<= 1 0)
(implies (< _n1 _N1) (> 1 0))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N1+0)
y1 = 0
x1 = 0
main = 0
n1 = __VERIFIER_nondet_int

3. Other axioms:
(1<=0)
(_n1<_N1) -> (1>0)

4. Assumption :
(__VERIFIER_nondet_int>0)

5. Assertion :
(0==0)
0
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

Assertion To Prove:(0==0)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0