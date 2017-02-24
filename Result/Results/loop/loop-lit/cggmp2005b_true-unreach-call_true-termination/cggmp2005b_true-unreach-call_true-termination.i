>>> file_name='sv-benchmarks/loop-lit/cggmp2005b_true-unreach-call_true-termination-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  int i;
  int j;
  int k;
  i = 0;
  k = 9;
  j = -100;
  while (i <= 100)
  {
    i = i + 1;
    while (j < 20)
    {
      j = i + j;
    }

    k = 4;
    while (k <= 3)
    {
      k = k + 1;
    }

  }

  _1_PROVE = k == 4;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ i:int k:int _1_PROVE:int RET:int j:int}
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
(= i1 (+ _N3 0))
(= k1 (k6 _N3))
(= j1 (j6 _N3))
(= main 0)

3. Other axioms:
(>= (_N1 _n3) (/ (+ (- (j6 _n3)) 20) (+ (+ _n3 0) 1)))
(implies (< _n1 (_N1 _n3)) (< (+ (* _n1 (+ (+ _n3 0) 1)) (j6 _n3)) 20))
(> (+ (_N2 _n3) 4) 3)
(implies (< _n2 (_N2 _n3)) (<= (+ _n2 4) 3))
(= (k6 (+ _n3 1)) (+ (_N2 _n3) 4))
(= (j6 (+ _n3 1)) (+ (* (_N1 _n3) (+ (+ _n3 0) 1)) (j6 _n3)))
(= (k6 0) 9)
(= (j6 0) (- 100))
(> (+ _N3 0) 100)
(implies (< _n3 _N3) (<= (+ _n3 0) 100))

Output in normal notation:
1. Frame axioms:

2. Output equations:
i1 = (_N3+0)
k1 = k6(_N3)
j1 = j6(_N3)
main = 0

3. Other axioms:
(_N1(_n3)>=((-(j6(_n3))+20)/((_n3+0)+1)))
(_n1<_N1(_n3)) -> (((_n1*((_n3+0)+1))+j6(_n3))<20)
((_N2(_n3)+4)>3)
(_n2<_N2(_n3)) -> ((_n2+4)<=3)
k6((_n3+1)) = (_N2(_n3)+4)
j6((_n3+1)) = ((_N1(_n3)*((_n3+0)+1))+j6(_n3))
k6(0) = 9
j6(0) = -(100)
((_N3+0)>100)
(_n3<_N3) -> ((_n3+0)<=100)

4. Assumption :

5. Assertion :
(k6(_N3)==4)
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

Assertion To Prove:(k6(_N3)==4)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0