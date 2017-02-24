>>> file_name='sv-benchmarks/loops/for_bounded_loop1_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _2_ASSUME = 0;
  int _1_PROVE[];
  int _2_PROVE[];
  int _3_PROVE = 0;
  int i = 0;
  int x = 0;
  int y = 0;
  int n = __VERIFIER_nondet_int();
  _1_ASSUME = n > 0;
  i = 0;
  while (i < n)
  {
    x = x - y;
    _1_PROVE[i] = x == 0;
    y = __VERIFIER_nondet_int();
    _2_ASSUME[i] = y != 0;
    x = x + y;
    _2_PROVE[i] = x != 0;
    i = i + 1;
  }

  _3_PROVE = x == 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ y:int i:int _1_PROVE:array _3_PROVE:int RET:int n:int _2_ASSUME:int _1_ASSUME:
int x:int _2_PROVE:array}
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
(= _2_PROVE1 _2_PROVE)

2. Output equations:
(= i1 (+ _N1 0))
(= (d1array1 _x1 _x2) (d1array7 _x1 _x2 _N1))
(= main 0)
(= n1 __VERIFIER_nondet_int)
(= y1 __VERIFIER_nondet_int)
(= x1 0)

3. Other axioms:
(= (d1array7 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ _n1 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE
_2_PROVE1 = _2_PROVE

2. Output equations:
i1 = (_N1+0)
d1array1(_x1,_x2) = d1array7(_x1,_x2,_N1)
main = 0
n1 = __VERIFIER_nondet_int
y1 = __VERIFIER_nondet_int
x1 = 0

3. Other axioms:
d1array7(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(-(0)+__VERIFIER_nondet_int))
(_n1<_N1) -> ((_n1+0)<__VERIFIER_nondet_int)

4. Assumption :
(__VERIFIER_nondet_int>0)

5. Assertion :
(0==0)
(((0-__VERIFIER_nondet_int)+__VERIFIER_nondet_int)!=0)
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
1