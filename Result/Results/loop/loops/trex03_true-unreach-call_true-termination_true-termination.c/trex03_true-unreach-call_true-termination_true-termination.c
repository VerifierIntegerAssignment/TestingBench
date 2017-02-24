>>> file_name='sv-benchmarks/loops/trex03_true-unreach-call_true-termination_true-termination.c'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned x1_var = __VERIFIER_nondet_uint();
  unsigned x2_var = __VERIFIER_nondet_uint();
  unsigned x3_var = __VERIFIER_nondet_uint();
  unsigned d1_var = 1;
  unsigned d2_var = 1;
  unsigned d3_var = 1;
  _Bool c1_var = __VERIFIER_nondet_bool();
  _Bool c2_var = __VERIFIER_nondet_bool();
  while (((x1_var > 0) && (x2_var > 0)) && (x3_var > 0))
  {
    if (c1_var > 0)
    {
      x1_var = x1_var - d1_var;
    }
    else
      if (c2_var > 0)
    {
      x3_var = x3_var - d3_var;
    }


    c1_var = __VERIFIER_nondet_bool();
    c2_var = __VERIFIER_nondet_bool();
  }

  _1_PROVE = ((x1_var == 0) || (x2_var == 0)) || (x3_var == 0);
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ x3_var:unsigned d3_var:unsigned x1_var:unsigned d2_var:unsigned _1_PROVE:int R
ET:int d1_var:unsigned c1_var:_Bool x2_var:unsigned c2_var:_Bool}
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
(= c2_var1 __VERIFIER_nondet_bool)
(= d3_var1 1)
(= x1_var1 (x1_var6 _N1))
(= d2_var1 1)
(= x3_var1 (x3_var6 _N1))
(= main 0)
(= d1_var1 1)
(= c1_var1 __VERIFIER_nondet_bool)
(= x2_var1 __VERIFIER_nondet_uint)

3. Other axioms:
(= (x1_var6 (+ _n1 1)) (ite (> __VERIFIER_nondet_bool 0) (- (x1_var6 _n1) 1) (x1
_var6 _n1)))
(= (x3_var6 (+ _n1 1)) (ite (> __VERIFIER_nondet_bool 0) (x3_var6 _n1) (ite (> _
_VERIFIER_nondet_bool 0) (- (x3_var6 _n1) 1) (x3_var6 _n1))))
(= (x1_var6 0) __VERIFIER_nondet_uint)
(= (x3_var6 0) __VERIFIER_nondet_uint)
(or (or (<= (x1_var6 _N1) 0) (<= __VERIFIER_nondet_uint 0)) (<= (x3_var6 _N1) 0)
)
(implies (< _n1 _N1) (and (and (> (x1_var6 _n1) 0) (> __VERIFIER_nondet_uint 0))
 (> (x3_var6 _n1) 0)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
c2_var1 = __VERIFIER_nondet_bool
d3_var1 = 1
x1_var1 = x1_var6(_N1)
d2_var1 = 1
x3_var1 = x3_var6(_N1)
main = 0
d1_var1 = 1
c1_var1 = __VERIFIER_nondet_bool
x2_var1 = __VERIFIER_nondet_uint

3. Other axioms:
x1_var6((_n1+1)) = ite((__VERIFIER_nondet_bool>0),(x1_var6(_n1)-1),x1_var6(_n1))

x3_var6((_n1+1)) = ite((__VERIFIER_nondet_bool>0),x3_var6(_n1),ite((__VERIFIER_n
ondet_bool>0),(x3_var6(_n1)-1),x3_var6(_n1)))
x1_var6(0) = __VERIFIER_nondet_uint
x3_var6(0) = __VERIFIER_nondet_uint
(((x1_var6(_N1)<=0) or (__VERIFIER_nondet_uint<=0)) or (x3_var6(_N1)<=0))
(_n1<_N1) -> (((x1_var6(_n1)>0) and (__VERIFIER_nondet_uint>0)) and (x3_var6(_n1
)>0))

4. Assumption :

5. Assertion :
(((x1_var6(_N1)==0) or (__VERIFIER_nondet_uint==0)) or (x3_var6(_N1)==0))
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

Assertion To Prove:Or(Or((x1_var6(_N1)==0),(__VERIFIER_nondet_uint==0)),(x3_var6
(_N1)==0))
Counter Example
[__VERIFIER_nondet_bool = 0,
 d3_var1 = 1,
 __VERIFIER_nondet_uint = -1,
 c1_var1 = False,
 x1_var1 = -1,
 c2_var1 = False,
 d1_var1 = 1,
 d2_var1 = 1,
 _N1 = 0,
 x3_var1 = -1,
 main = 0,
 x2_var1 = -1,
 _f = [else -> Var(0)],
 x3_var6 = [else -> -1],
 x1_var6 = [else -> -1]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0