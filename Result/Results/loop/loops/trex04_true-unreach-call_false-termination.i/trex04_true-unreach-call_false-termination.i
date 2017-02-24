>>> file_name='sv-benchmarks/loops/trex04_true-unreach-call_false-termination.i'

>>> prove_auto(file_name)
Program Body
{
  int f2_2_RET = 0;
  int f2_2_c2_var = 0;
  int f2_1_c1_var = 0;
  int f2_2_c1_var = 0;
  int f2_1_RET = 0;
  int f2_1_c2_var = 0;
  int _1DUMMY = 0;
  int _2DUMMY = 0;
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE = 0;
  int d = 1;
  int x = __VERIFIER_nondet_int();
  _1_ASSUME = (x <= 1000000) && (x >= (-1000000));
  _Bool c1_var = __VERIFIER_nondet_bool();
  _Bool c2_var = __VERIFIER_nondet_bool();
  if (c1_var > 0)
  {
    d = d - 1;
  }

  if (c2_var > 0)
  {
    f2_1_RET = 0;
    y = 0;
    f2_1_c1_var = __VERIFIER_nondet_bool();
    f2_1_c2_var = __VERIFIER_nondet_bool();
    if (f2_1_c1_var > 0)
    {
      y = y + 1;
    }

    if (f2_1_c2_var > 0)
    {
      y = y + 10;
    }

  }

  c1_var = __VERIFIER_nondet_bool();
  c2_var = __VERIFIER_nondet_bool();
  if (c1_var > 0)
  {
    f2_2_RET = 0;
    y = 0;
    f2_2_c1_var = __VERIFIER_nondet_bool();
    f2_2_c2_var = __VERIFIER_nondet_bool();
    if (f2_2_c1_var > 0)
    {
      y = y + 1;
    }

    if (f2_2_c2_var > 0)
    {
      y = y + 10;
    }

  }

  if (c2_var > 0)
  {
    d = d - 1;
  }

  while (x > 0)
  {
    x = x - d;
  }

  _1_PROVE = x <= 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ c2_var:_Bool d:int f2_2_RET:int f2_2_c2_var:int _1_PROVE:int RET:int _1DUMMY:i
nt _1_ASSUME:int f2_1_c1_var:int _2DUMMY:int f2_2_c1_var:int f2_1_RET:int x:int
c1_var:_Bool f2_1_c2_var:int}
Program Body
{
  int RET = 0;
  int y = 0;
  _Bool c1_var = __VERIFIER_nondet_bool();
  _Bool c2_var = __VERIFIER_nondet_bool();
  if (c1_var > 0)
  {
    y = y + 1;
  }

  if (c2_var > 0)
  {
    y = y + 10;
  }

}

Function Name:
foo
Return Type:
void
Input Variables:
{}
Local Variables:
{ y:int c2_var:_Bool c1_var:_Bool RET:int}
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
(= d1 (ite (> __VERIFIER_nondet_bool 0) (- (ite (> __VERIFIER_nondet_bool 0) (-
1 1) 1) 1) (ite (> __VERIFIER_nondet_bool 0) (- 1 1) 1)))
(= f2_2_RET1 (ite (> __VERIFIER_nondet_bool 0) 0 0))
(= f2_2_c2_var1 (ite (> __VERIFIER_nondet_bool 0) __VERIFIER_nondet_bool 0))
(= c2_var1 __VERIFIER_nondet_bool)
(= main 0)
(= _1DUMMY1 0)
(= f2_1_c1_var1 (ite (> __VERIFIER_nondet_bool 0) __VERIFIER_nondet_bool 0))
(= _2DUMMY1 0)
(= f2_2_c1_var1 (ite (> __VERIFIER_nondet_bool 0) __VERIFIER_nondet_bool 0))
(= f2_1_RET1 (ite (> __VERIFIER_nondet_bool 0) 0 0))
(= x1 (+ (* (- _N1) (ite (> __VERIFIER_nondet_bool 0) (- (ite (> __VERIFIER_nond
et_bool 0) (- 1 1) 1) 1) (ite (> __VERIFIER_nondet_bool 0) (- 1 1) 1))) __VERIFI
ER_nondet_int))
(= c1_var1 __VERIFIER_nondet_bool)
(= f2_1_c2_var1 (ite (> __VERIFIER_nondet_bool 0) __VERIFIER_nondet_bool 0))

3. Other axioms:
(>= _N1 (/ __VERIFIER_nondet_int (ite (> __VERIFIER_nondet_bool 0) (- (ite (> __
VERIFIER_nondet_bool 0) (- 1 1) 1) 1) (ite (> __VERIFIER_nondet_bool 0) (- 1 1)
1))))
(implies (< _n1 _N1) (> (+ (* (- _n1) (ite (> __VERIFIER_nondet_bool 0) (- (ite
(> __VERIFIER_nondet_bool 0) (- 1 1) 1) 1) (ite (> __VERIFIER_nondet_bool 0) (-
1 1) 1))) __VERIFIER_nondet_int) 0))

Output in normal notation:
1. Frame axioms:

2. Output equations:
d1 = ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_nondet_bool>0),(1-1),1)-1),
ite((__VERIFIER_nondet_bool>0),(1-1),1))
f2_2_RET1 = ite((__VERIFIER_nondet_bool>0),0,0)
f2_2_c2_var1 = ite((__VERIFIER_nondet_bool>0),__VERIFIER_nondet_bool,0)
c2_var1 = __VERIFIER_nondet_bool
main = 0
_1DUMMY1 = 0
f2_1_c1_var1 = ite((__VERIFIER_nondet_bool>0),__VERIFIER_nondet_bool,0)
_2DUMMY1 = 0
f2_2_c1_var1 = ite((__VERIFIER_nondet_bool>0),__VERIFIER_nondet_bool,0)
f2_1_RET1 = ite((__VERIFIER_nondet_bool>0),0,0)
x1 = ((-(_N1)*ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_nondet_bool>0),(1-
1),1)-1),ite((__VERIFIER_nondet_bool>0),(1-1),1)))+__VERIFIER_nondet_int)
c1_var1 = __VERIFIER_nondet_bool
f2_1_c2_var1 = ite((__VERIFIER_nondet_bool>0),__VERIFIER_nondet_bool,0)

3. Other axioms:
(_N1>=(__VERIFIER_nondet_int/ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_non
det_bool>0),(1-1),1)-1),ite((__VERIFIER_nondet_bool>0),(1-1),1))))
(_n1<_N1) -> (((-(_n1)*ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_nondet_bo
ol>0),(1-1),1)-1),ite((__VERIFIER_nondet_bool>0),(1-1),1)))+__VERIFIER_nondet_in
t)>0)

4. Assumption :
((__VERIFIER_nondet_int<=1000000) and (__VERIFIER_nondet_int>=-(1000000)))

5. Assertion :
(((-(_N1)*ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_nondet_bool>0),(1-1),1
)-1),ite((__VERIFIER_nondet_bool>0),(1-1),1)))+__VERIFIER_nondet_int)<=0)
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
Output for foo:
Output in prefix notation:
1. Frame axioms:

2. Output equations:
(= y1 (ite (> __VERIFIER_nondet_bool 0) (+ (ite (> __VERIFIER_nondet_bool 0) (+
0 1) 0) 10) (ite (> __VERIFIER_nondet_bool 0) (+ 0 1) 0)))
(= c2_var1 __VERIFIER_nondet_bool)
(= c1_var1 __VERIFIER_nondet_bool)
(= foo 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:

2. Output equations:
y1 = ite((__VERIFIER_nondet_bool>0),(ite((__VERIFIER_nondet_bool>0),(0+1),0)+10)
,ite((__VERIFIER_nondet_bool>0),(0+1),0))
c2_var1 = __VERIFIER_nondet_bool
c1_var1 = __VERIFIER_nondet_bool
foo = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:(((-_N1*If(__VERIFIER_nondet_bool > 0,If(__VERIFIER_nondet_bo
ol > 0,1-1,1)-1,If(__VERIFIER_nondet_bool > 0,1-1,1)))+__VERIFIER_nondet_int)<=0
)
Counter Example
[f2_1_RET1 = 0,
 __VERIFIER_nondet_bool = 1,
 _1DUMMY1 = 0,
 _2DUMMY1 = 0,
 f2_2_c1_var1 = 1,
 c1_var1 = True,
 c2_var1 = True,
 d1 = -1,
 x1 = 2,
 main = 0,
 f2_1_c1_var1 = 1,
 __VERIFIER_nondet_int = 1,
 f2_2_c2_var1 = 1,
 f2_1_c2_var1 = 1,
 _N1 = 1,
 f2_2_RET1 = 0,
 _f = [0 -> 0, else -> Var(0)]]


Function Name--__VERIFIER_assert
No Assertion to Prove