>>> file_name='sv-benchmarks/loop-invgen/large_const_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _2_ASSUME = 0;
  int _1_PROVE[];
  int c1_var = 4000;
  int c2_var = 2000;
  int c3_var = 10000;
  int n;
  int v;
  int i;
  int k;
  int j;
  n = __VERIFIER_nondet_int();
  _1_ASSUME = (0 <= n) && (n < 10);
  k = 0;
  i = 0;
  while (i < n)
  {
    i = i + 1;
    v = __VERIFIER_nondet_int();
    _2_ASSUME[i] = (0 <= v) && (n < 2);
    if (v == 0)
    {
      k = k + c1_var;
    }
    else
      if (v == 1)
    {
      k = k + c3_var;
    }


  }

  j = 0;
  while (j < n)
  {
    _1_PROVE[j] = k > 0;
    j = j + 1;
    k = k - 1;
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
{ c2_var:int i:int k:int _1_PROVE:array RET:int n:int _2_ASSUME:int v:int _1_ASS
UME:int j:int c1_var:int c3_var:int}
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
(= (d1array1 _x1 _x2) (d1array10 _x1 _x2 _N2))
(= i1 (+ _N1 0))
(= k1 (k10 _N2))
(= j1 (+ _N2 0))
(= main 0)
(= n1 __VERIFIER_nondet_int)
(= v1 __VERIFIER_nondet_int)
(= c1_var1 4000)
(= c3_var1 10000)
(= c2_var1 2000)

3. Other axioms:
(= (k7 (+ _n1 1)) (ite (== __VERIFIER_nondet_int 0) (+ (k7 _n1) 4000) (ite (== _
_VERIFIER_nondet_int 1) (+ (k7 _n1) 10000) (k7 _n1))))
(= (d1array7 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 0) (= _x2 (+ (+ _n1 0) 1))) (an
d (<= 0 __VERIFIER_nondet_int) (< __VERIFIER_nondet_int 2)) (d1array7 _x1 _x2 _n
1)))
(= (k7 0) 0)
(= (d1array7 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ _n1 0) __VERIFIER_nondet_int))
(= (k10 (+ _n2 1)) (- (k10 _n2) 1))
(= (k10 0) (k7 _N1))
(= (d1array10 _x1 _x2 0) (d1array7 _x1 _x2 _N1))
(>= _N2 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n2 _N2) (< (+ _n2 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE

2. Output equations:
d1array1(_x1,_x2) = d1array10(_x1,_x2,_N2)
i1 = (_N1+0)
k1 = k10(_N2)
j1 = (_N2+0)
main = 0
n1 = __VERIFIER_nondet_int
v1 = __VERIFIER_nondet_int
c1_var1 = 4000
c3_var1 = 10000
c2_var1 = 2000

3. Other axioms:
k7((_n1+1)) = ite((__VERIFIER_nondet_int==0),(k7(_n1)+4000),ite((__VERIFIER_nond
et_int==1),(k7(_n1)+10000),k7(_n1)))
d1array7(_x1,_x2,(_n1+1)) = ite(((_x1=0) and (_x2=((_n1+0)+1))),((0<=__VERIFIER_
nondet_int) and (__VERIFIER_nondet_int<2)),d1array7(_x1,_x2,_n1))
k7(0) = 0
d1array7(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(-(0)+__VERIFIER_nondet_int))
(_n1<_N1) -> ((_n1+0)<__VERIFIER_nondet_int)
k10((_n2+1)) = (k10(_n2)-1)
k10(0) = k7(_N1)
d1array10(_x1,_x2,0) = d1array7(_x1,_x2,_N1)
(_N2>=(-(0)+__VERIFIER_nondet_int))
(_n2<_N2) -> ((_n2+0)<__VERIFIER_nondet_int)

4. Assumption :
((0<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<10))

5. Assertion :
(k10(_n2)>0)
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

Assertion To Prove:ForAll([_n2],k10(_n2) > 0)
Traceback (most recent call last):
  File "z3query.py", line 65, in <module>
    _s.add(ForAll([_x2,_x1,_n1],Implies(And(_x2>=0,_n1>=0),d1array7(_x1, _x2, _n
1 + 1) == If(And((_x1==0),(_x2==_n1 + 1)),And(0 <= __VERIFIER_nondet_int,__VERIF
IER_nondet_int < 2),d1array7(_x1, _x2, _n1)))))
  File "C:\Research\z3-master\z3-master\build\z3.py", line 801, in __eq__
    a, b = _coerce_exprs(self, other)
  File "C:\Research\z3-master\z3-master\build\z3.py", line 966, in _coerce_exprs

    b = s.cast(b)
  File "C:\Research\z3-master\z3-master\build\z3.py", line 500, in cast
    _z3_assert(is_expr(val), "Z3 expression expected")
  File "C:\Research\z3-master\z3-master\build\z3.py", line 86, in _z3_assert
    raise Z3Exception(msg)
z3types.Z3Exception: Z3 expression expected
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
2