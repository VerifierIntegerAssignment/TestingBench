>>> file_name='sv-benchmarks/loops/terminator_01_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int x = __VERIFIER_nondet_int();
  int p[];
  p = _address(x);
  while (x < 100)
  {
    p[0] = p[0] + 1;
  }

  _1_PROVE = 0 > 0;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ x:int _1_PROVE:int RET:int p:array}
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
(= x1 __VERIFIER_nondet_int)
(= (d1array1 _x1 _x2) (d1array1 _x1 _x2 _N1))
(= main 0)
(= p1 (_address __VERIFIER_nondet_int))

3. Other axioms:
(= (d1array1 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 (_address __VERIFIER_nondet_int
)) (= _x2 0)) (+ (d1array1 (_address __VERIFIER_nondet_int) 0 _n1) 1) (d1array1
_x1 _x2 _n1)))
(= (d1array1 _x1 _x2 0) (d1array _x1 _x2))
(>= __VERIFIER_nondet_int 100)
(implies (< _n1 _N1) (< __VERIFIER_nondet_int 100))

Output in normal notation:
1. Frame axioms:

2. Output equations:
x1 = __VERIFIER_nondet_int
d1array1(_x1,_x2) = d1array1(_x1,_x2,_N1)
main = 0
p1 = _address(__VERIFIER_nondet_int)

3. Other axioms:
d1array1(_x1,_x2,(_n1+1)) = ite(((_x1=_address(__VERIFIER_nondet_int)) and (_x2=
0)),(d1array1(_address(__VERIFIER_nondet_int),0,_n1)+1),d1array1(_x1,_x2,_n1))
d1array1(_x1,_x2,0) = d1array(_x1,_x2)
(__VERIFIER_nondet_int>=100)
(_n1<_N1) -> (__VERIFIER_nondet_int<100)

4. Assumption :

5. Assertion :
(0>0)
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

Assertion To Prove:(0>0)

Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0