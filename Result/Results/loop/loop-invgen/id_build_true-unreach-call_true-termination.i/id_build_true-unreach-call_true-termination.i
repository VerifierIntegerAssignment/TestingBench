>>> file_name='sv-benchmarks/loop-invgen/id_build_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE[][];
  int _2_PROVE[][];
  int offset;
  int length;
  int nlen = __VERIFIER_nondet_int();
  int i;
  int j;
  i = 0;
  while (i < nlen)
  {
    j = 0;
    while (j < 8)
    {
      _1_PROVE[j][i] = 0 <= ((nlen - 1) - i);
      _2_PROVE[j][i] = ((nlen - 1) - i) < nlen;
      j = j + 1;
    }

    i = i + 1;
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
{ j:int i:int _1_PROVE:array RET:int nlen:int length:int offset:int _2_PROVE:arr
ay}
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
(= length1 length)
(= _1_PROVE1 _1_PROVE)
(= _2_PROVE1 _2_PROVE)
(= offset1 offset)

2. Output equations:
(= i1 (+ _N2 0))
(= j1 (j6 _N2))
(= main 0)
(= (d2array1 _x1 _x2 _x3) (d2array6 _x1 _x2 _x3 _N2))
(= nlen1 __VERIFIER_nondet_int)

3. Other axioms:
(= (d2array3 _x1 _x2 _x3 0 _n2) (d2array6 _x1 _x2 _x3 _n2))
(>= (_N1 _n2) (+ (- 0) 8))
(implies (< _n1 (_N1 _n2)) (< (+ _n1 0) 8))
(= (j6 (+ _n2 1)) (+ (_N1 _n2) 0))
(= (d2array6 _x1 _x2 _x3 (+ _n2 1)) (d2array3 _x1 _x2 _x3 (_N1 _n2) _n2))
(= (j6 0) j)
(= (d2array6 _x1 _x2 _x3 0) (d2array _x1 _x2 _x3))
(>= _N2 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n2 _N2) (< (+ _n2 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:
length1 = length
_1_PROVE1 = _1_PROVE
_2_PROVE1 = _2_PROVE
offset1 = offset

2. Output equations:
i1 = (_N2+0)
j1 = j6(_N2)
main = 0
d2array1(_x1,_x2,_x3) = d2array6(_x1,_x2,_x3,_N2)
nlen1 = __VERIFIER_nondet_int

3. Other axioms:
d2array3(_x1,_x2,_x3,0,_n2) = d2array6(_x1,_x2,_x3,_n2)
(_N1(_n2)>=(-(0)+8))
(_n1<_N1(_n2)) -> ((_n1+0)<8)
j6((_n2+1)) = (_N1(_n2)+0)
d2array6(_x1,_x2,_x3,(_n2+1)) = d2array3(_x1,_x2,_x3,_N1(_n2),_n2)
j6(0) = j
d2array6(_x1,_x2,_x3,0) = d2array(_x1,_x2,_x3)
(_N2>=(-(0)+__VERIFIER_nondet_int))
(_n2<_N2) -> ((_n2+0)<__VERIFIER_nondet_int)

4. Assumption :

5. Assertion :
(((__VERIFIER_nondet_int-1)-(_n2+0))<__VERIFIER_nondet_int)
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

Assertion To Prove:ForAll([_n2],__VERIFIER_nondet_int - _n2 - 1 < __VERIFIER_non
det_int)
Successfully Proved