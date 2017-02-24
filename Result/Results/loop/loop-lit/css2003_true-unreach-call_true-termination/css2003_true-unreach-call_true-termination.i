>>> file_name='sv-benchmarks/loop-lit/css2003_true-unreach-call_true-termination
-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE[];
  int i;
  int j;
  int k;
  i = 1;
  j = 1;
  k = __VERIFIER_nondet_int();
  _1_ASSUME = (0 <= k) && (k <= 1);
  while (i < 1000000)
  {
    i = i + 1;
    j = j + k;
    k = k - 1;
    _1_PROVE[i] = ((1 <= (i + k)) && (1 <= (i + k))) && ((1 <= (i + k)) && (1 <=
 (i + k)));
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
{ j:int i:int k:int _1_PROVE:array RET:int _1_ASSUME:int}
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
(= i1 (+ _N1 1))
(= k1 (k4 _N1))
(= j1 (j4 _N1))
(= (d1array1 _x1 _x2) (d1array4 _x1 _x2 _N1))
(= main 0)

3. Other axioms:
(= (k4 (+ _n1 1)) (- (k4 _n1) 1))
(= (j4 (+ _n1 1)) (+ (j4 _n1) (k4 _n1)))
(= (k4 0) __VERIFIER_nondet_int)
(= (d1array4 _x1 _x2 0) (d1array _x1 _x2))
(= (j4 0) 1)
(>= _N1 (+ (- 1) 1000000))
(implies (< _n1 _N1) (< (+ _n1 1) 1000000))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE

2. Output equations:
i1 = (_N1+1)
k1 = k4(_N1)
j1 = j4(_N1)
d1array1(_x1,_x2) = d1array4(_x1,_x2,_N1)
main = 0

3. Other axioms:
k4((_n1+1)) = (k4(_n1)-1)
j4((_n1+1)) = (j4(_n1)+k4(_n1))
k4(0) = __VERIFIER_nondet_int
d1array4(_x1,_x2,0) = d1array(_x1,_x2)
j4(0) = 1
(_N1>=(-(1)+1000000))
(_n1<_N1) -> ((_n1+1)<1000000)

4. Assumption :
((0<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=1))

5. Assertion :
(((1<=(((_n1+1)+1)+(k4(_n1)-1))) and (1<=(((_n1+1)+1)+(k4(_n1)-1)))) and ((1<=((
(_n1+1)+1)+(k4(_n1)-1))) and (1<=(((_n1+1)+1)+(k4(_n1)-1)))))
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

Assertion To Prove:ForAll([_n1],And(And(1 <= _n1 + k4(_n1) + 1,1 <= _n1 + k4(_n1
) + 1),And(1 <= _n1 + k4(_n1) + 1,1 <= _n1 + k4(_n1) + 1)))
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0