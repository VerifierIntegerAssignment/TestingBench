>>> file_name='sv-benchmarks/loop-lit/ddlm2013_true-unreach-call-i.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned i;
  unsigned j;
  unsigned a;
  unsigned b;
  int flag = __VERIFIER_nondet_int();
  a = 0;
  b = 0;
  j = 1;
  if (flag > 0)
  {
    i = 0;
  }
  else
  {
    i = 1;
  }

  while (__VERIFIER_nondet_int() > 0)
  {
    a = a + 1;
    b = b + (j - i);
    i = i + 2;
    if ((i % 2) == 0)
    {
      j = j + 2;
    }
    else
    {
      j = j + 1;
    }

  }

  if (flag > 0)
  {
    _1_PROVE = a == b;
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
{ a:unsigned b:unsigned i:unsigned _1_PROVE:int RET:int j:unsigned flag:int}
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
(= a1 (+ _N1 0))
(= b1 (b8 _N1))
(= i1 (+ (* 2 _N1) (ite (> __VERIFIER_nondet_int 0) 0 1)))
(= j1 (j8 _N1))
(= main 0)
(= flag1 __VERIFIER_nondet_int)

3. Other axioms:
(= (b8 (+ _n1 1)) (+ (b8 _n1) (- (j8 _n1) (+ (* 2 _n1) (ite (> __VERIFIER_nondet
_int 0) 0 1)))))
(= (j8 (+ _n1 1)) (ite (== (% (+ (+ (* 2 _n1) (ite (> __VERIFIER_nondet_int 0) 0
 1)) 2) 2) 0) (+ (j8 _n1) 2) (+ (j8 _n1) 1)))
(= (b8 0) 0)
(= (j8 0) 1)
(<= __VERIFIER_nondet_int 0)
(implies (< _n1 _N1) (> __VERIFIER_nondet_int 0))

Output in normal notation:
1. Frame axioms:

2. Output equations:
a1 = (_N1+0)
b1 = b8(_N1)
i1 = ((2*_N1)+ite((__VERIFIER_nondet_int>0),0,1))
j1 = j8(_N1)
main = 0
flag1 = __VERIFIER_nondet_int

3. Other axioms:
b8((_n1+1)) = (b8(_n1)+(j8(_n1)-((2*_n1)+ite((__VERIFIER_nondet_int>0),0,1))))
j8((_n1+1)) = ite((((((2*_n1)+ite((__VERIFIER_nondet_int>0),0,1))+2)%2)==0),(j8(
_n1)+2),(j8(_n1)+1))
b8(0) = 0
j8(0) = 1
(__VERIFIER_nondet_int<=0)
(_n1<_N1) -> (__VERIFIER_nondet_int>0)

4. Assumption :

5. Assertion :
ite((__VERIFIER_nondet_int>0),((_N1+0)==b8(_N1)),0)
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

Assertion To Prove:Implies(__VERIFIER_nondet_int > 0,_N1==b8(_N1))
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0
>>>