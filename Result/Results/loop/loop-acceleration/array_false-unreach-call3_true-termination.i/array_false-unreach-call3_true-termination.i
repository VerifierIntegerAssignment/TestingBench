>>> file_name='sv-benchmarks/loop-acceleration/array_false-unreach-call3_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int A[];
  int i;
  i = 0;
  while ((A[i] != 0) && (i < 1024))
  {
    i = i + 1;
  }

  _1_PROVE = i <= (1024 / 2);
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
(= (d1array1 _x1 _x2) (d1array _x1 _x2))

2. Output equations:
(= i1 (+ _N1 0))
(= main 0)

3. Other axioms:
(or (== (d1array A (+ _N1 0)) 0) (>= (+ _N1 0) 1024))
(implies (< _n1 _N1) (and (!= (d1array A (+ _n1 0)) 0) (< (+ _n1 0) 1024)))

Output in normal notation:
1. Frame axioms:
A1 = A
d1array1(_x1,_x2) = d1array(_x1,_x2)

2. Output equations:
i1 = (_N1+0)
main = 0

3. Other axioms:
((d1array(A,(_N1+0))==0) or ((_N1+0)>=1024))
(_n1<_N1) -> ((d1array(A,(_n1+0))!=0) and ((_n1+0)<1024))

4. Assumption :

5. Assertion :
((_N1+0)<=(1024/2))
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

Assertion To Prove:(_N1<=(1024/2))
Counter Example
[A1 = arraySort!val!0,
 A = arraySort!val!0,
 i1 = 1024,
 _N1 = 1024,
 main = 0,
 d1array1 = [(arraySort!val!0, 1023) -> 1,
             (arraySort!val!0, 0) -> 2,
             else -> d1array(Var(0), Var(1))],
 _f = [0 -> 0, else -> Var(0)],
 d1array = [(arraySort!val!0, 0) -> 2, else -> 1]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0