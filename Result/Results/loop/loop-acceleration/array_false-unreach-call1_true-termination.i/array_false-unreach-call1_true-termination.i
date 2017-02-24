>>> file_name='sv-benchmarks/loop-acceleration/array_false-unreach-call1_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int A[];
  int i;
  i = 0;
  while (i < 1024)
  {
    A[i] = i;
    i = i + 1;
  }

  _1_PROVE = A[1023] != 1023;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ A:array i:int _1_PROVE:int RET:int}
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
(= A1 A)

2. Output equations:
(= i1 (+ _N1 0))
(= (d1array1 _x1 _x2) (d1array2 _x1 _x2 _N1))
(= main 0)

3. Other axioms:
(= (d1array2 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 A) (= _x2 (+ _n1 0))) (+ _n1 0)
 (d1array2 _x1 _x2 _n1)))
(= (d1array2 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (+ (- 0) 1024))
(implies (< _n1 _N1) (< (+ _n1 0) 1024))

Output in normal notation:
1. Frame axioms:
A1 = A

2. Output equations:
i1 = (_N1+0)
d1array1(_x1,_x2) = d1array2(_x1,_x2,_N1)
main = 0

3. Other axioms:
d1array2(_x1,_x2,(_n1+1)) = ite(((_x1=A) and (_x2=(_n1+0))),(_n1+0),d1array2(_x1
,_x2,_n1))
d1array2(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(-(0)+1024))
(_n1<_N1) -> ((_n1+0)<1024)

4. Assumption :

5. Assertion :
(d1array2(A,1023,_N1)!=1023)
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

Assertion To Prove:(d1array2(A, 1023, _N1)!=1023)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0