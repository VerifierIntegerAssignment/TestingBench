>>> file_name='sv-benchmarks/loop-acceleration/array_true-unreach-call2_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int A[];
  int B[];
  int i;
  int tmp;
  i = 0;
  while (i < 2048)
  {
    tmp = A[i];
    B[i] = tmp;
    i = i + 1;
  }

  _1_PROVE = A[2048 / 2] == B[2048 / 2];
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ A:array tmp:int B:array i:int _1_PROVE:int RET:int}
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
(= B1 B)

2. Output equations:
(= tmp1 (tmp3 _N1))
(= i1 (+ _N1 0))
(= (d1array1 _x1 _x2) (d1array3 _x1 _x2 _N1))
(= main 0)

3. Other axioms:
(= (tmp3 (+ _n1 1)) (d1array3 A (+ _n1 0) _n1))
(= (d1array3 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 B) (= _x2 (+ _n1 0))) (d1array3
 A (+ _n1 0) _n1) (d1array3 _x1 _x2 _n1)))
(= (tmp3 0) tmp)
(= (d1array3 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (+ (- 0) 2048))
(implies (< _n1 _N1) (< (+ _n1 0) 2048))

Output in normal notation:
1. Frame axioms:
A1 = A
B1 = B

2. Output equations:
tmp1 = tmp3(_N1)
i1 = (_N1+0)
d1array1(_x1,_x2) = d1array3(_x1,_x2,_N1)
main = 0

3. Other axioms:
tmp3((_n1+1)) = d1array3(A,(_n1+0),_n1)
d1array3(_x1,_x2,(_n1+1)) = ite(((_x1=B) and (_x2=(_n1+0))),d1array3(A,(_n1+0),_
n1),d1array3(_x1,_x2,_n1))
tmp3(0) = tmp
d1array3(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(-(0)+2048))
(_n1<_N1) -> ((_n1+0)<2048)

4. Assumption :

5. Assertion :
(d1array3(A,(2048/2),_N1)==d1array3(B,(2048/2),_N1))
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

Assertion To Prove:(d1array3(A,2048/2,_N1)==d1array3(B,2048/2,_N1))
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0