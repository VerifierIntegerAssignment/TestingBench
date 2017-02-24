>>> file_name='sv-benchmarks/loops/n.c11_true-unreach-call.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int a[];
  unsigned len = 0;
  int i;
  while (__VERIFIER_nondet_bool() > 0)
  {
    if (len == 4)
    {
      len = 0;
    }

    a[len] = 0;
    len = len + 1;
  }

  _1_PROVE = (len >= 0) && (len >= 0);
  RET = 1;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ a:array i:int _1_PROVE:int len:unsigned RET:int}
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
(= a1 a)
(= i1 i)

2. Output equations:
(= (d1array1 _x1 _x2) (d1array4 _x1 _x2 _N1))
(= main 1)
(= len1 (len4 _N1))

3. Other axioms:
(= (d1array4 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 a) (= _x2 (ite (== (len4 _n1) 4
) 0 (len4 _n1)))) 0 (d1array4 _x1 _x2 _n1)))
(= (len4 (+ _n1 1)) (+ (ite (== (len4 _n1) 4) 0 (len4 _n1)) 1))
(= (d1array4 _x1 _x2 0) (d1array _x1 _x2))
(= (len4 0) 0)
(<= __VERIFIER_nondet_bool 0)
(implies (< _n1 _N1) (> __VERIFIER_nondet_bool 0))

Output in normal notation:
1. Frame axioms:
a1 = a
i1 = i

2. Output equations:
d1array1(_x1,_x2) = d1array4(_x1,_x2,_N1)
main = 1
len1 = len4(_N1)

3. Other axioms:
d1array4(_x1,_x2,(_n1+1)) = ite(((_x1=a) and (_x2=ite((len4(_n1)==4),0,len4(_n1)
))),0,d1array4(_x1,_x2,_n1))
len4((_n1+1)) = (ite((len4(_n1)==4),0,len4(_n1))+1)
d1array4(_x1,_x2,0) = d1array(_x1,_x2)
len4(0) = 0
(__VERIFIER_nondet_bool<=0)
(_n1<_N1) -> (__VERIFIER_nondet_bool>0)

4. Assumption :

5. Assertion :
((len4(_N1)>=0) and (len4(_N1)>=0))
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

Assertion To Prove:And(len4(_N1) >= 0,len4(_N1) >= 0)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0