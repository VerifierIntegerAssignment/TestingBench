>>> file_name='sv-benchmarks/loop-acceleration/array_true-unreach-call3_true-termination.c'
>>> prove_auto(file_name)
Program Body
{
  int break_1_flag = 0;
  int RET = 0;
  int _1_PROVE = 0;
  int A[];
  int i;
  i = 0;
  while ((A[i] != 0) && (break_1_flag == 0))
  {
    break_1_flag = 0;
    if (i >= N_var)
    {
      break_1_flag = 1;
    }

    if (break_1_flag == 0)
    {
      i = i + 1;
    }

  }

  _1_PROVE = i <= N_var;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ A:array i:int _1_PROVE:int RET:int break_1_flag:int}
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
(= i1 (i5 _N1))
(= main 0)
(= break_1_flag1 (break_1_flag5 _N1))

3. Other axioms:
(= (i5 (+ _n1 1)) (ite (== (ite (>= (i5 _n1) N_var) 1 0) 0) (+ (i5 _n1) 1) (i5 _
n1)))
(= (break_1_flag5 (+ _n1 1)) (ite (>= (i5 _n1) N_var) 1 0))
(= (i5 0) 0)
(= (break_1_flag5 0) 0)
(or (== (d1array A (i5 _N1)) 0) (!= (break_1_flag5 _N1) 0))
(implies (< _n1 _N1) (and (!= (d1array A (i5 _n1)) 0) (== (break_1_flag5 _n1) 0)
))

Output in normal notation:
1. Frame axioms:
A1 = A
d1array1(_x1,_x2) = d1array(_x1,_x2)

2. Output equations:
i1 = i5(_N1)
main = 0
break_1_flag1 = break_1_flag5(_N1)

3. Other axioms:
i5((_n1+1)) = ite((ite((i5(_n1)>=N_var),1,0)==0),(i5(_n1)+1),i5(_n1))
break_1_flag5((_n1+1)) = ite((i5(_n1)>=N_var),1,0)
i5(0) = 0
break_1_flag5(0) = 0
((d1array(A,i5(_N1))==0) or (break_1_flag5(_N1)!=0))
(_n1<_N1) -> ((d1array(A,i5(_n1))!=0) and (break_1_flag5(_n1)==0))

4. Assumption :

5. Assertion :
(i5(_N1)<=N_var)
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

Assertion To Prove:i5(_N1) <= N_var
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0