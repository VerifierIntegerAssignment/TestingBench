>>> file_name='sv-benchmarks/loops/nec20_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int b;
  int RET = 0;
  int _1_PROVE = 0;
  _Bool k = __VERIFIER_nondet_bool();
  int i;
  int n;
  int j;
  int a[];
  if (k > 0)
  {
    n = 0;
  }
  else
  {
    n = 1023;
  }

  i = 0;
  while (i <= n)
  {
    i = i + 1;
    j = j + 2;
  }

  a[i] = 0;
  a[j] = 0;
  _1_PROVE = j < 1025;
  a[b] = 0;
  if ((b >= 0) && (b < 1023))
  {
    a[b % 1023] = 1;
  }

  RET = 1;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ a:array b:int i:int k:_Bool _1_PROVE:int RET:int n:int j:int}
Program Body
{
  int b;
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
{ _1_FAILED:int b:int RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:
(= a1 a)
(= b1 b)

2. Output equations:
(= j1 (+ (* 2 _N1) j))
(= i1 (+ _N1 0))
(= k1 __VERIFIER_nondet_bool)
(= (d1array1 _x1 _x2) (ite (and (>= b 0) (< b 1023)) (ite (and (= _x1 a) (= _x2
(% b 1023))) 1 (ite (and (= _x1 a) (= _x2 b)) 0 (ite (and (= _x1 a) (= _x2 (+ (*
 2 _N1) j))) 0 (ite (and (= _x1 a) (= _x2 (+ _N1 0))) 0 (d1array _x1 _x2))))) (i
te (and (= _x1 a) (= _x2 b)) 0 (ite (and (= _x1 a) (= _x2 (+ (* 2 _N1) j))) 0 (i
te (and (= _x1 a) (= _x2 (+ _N1 0))) 0 (d1array _x1 _x2))))))
(= main 1)
(= n1 (ite (> __VERIFIER_nondet_bool 0) 0 1023))

3. Other axioms:
(> (+ _N1 0) (ite (> __VERIFIER_nondet_bool 0) 0 1023))
(implies (< _n1 _N1) (<= (+ _n1 0) (ite (> __VERIFIER_nondet_bool 0) 0 1023)))

Output in normal notation:
1. Frame axioms:
a1 = a
b1 = b

2. Output equations:
j1 = ((2*_N1)+j)
i1 = (_N1+0)
k1 = __VERIFIER_nondet_bool
d1array1(_x1,_x2) = ite(((b>=0) and (b<1023)),ite(((_x1=a) and (_x2=(b%1023))),1
,ite(((_x1=a) and (_x2=b)),0,ite(((_x1=a) and (_x2=((2*_N1)+j))),0,ite(((_x1=a)
and (_x2=(_N1+0))),0,d1array(_x1,_x2))))),ite(((_x1=a) and (_x2=b)),0,ite(((_x1=
a) and (_x2=((2*_N1)+j))),0,ite(((_x1=a) and (_x2=(_N1+0))),0,d1array(_x1,_x2)))
))
main = 1
n1 = ite((__VERIFIER_nondet_bool>0),0,1023)

3. Other axioms:
((_N1+0)>ite((__VERIFIER_nondet_bool>0),0,1023))
(_n1<_N1) -> ((_n1+0)<=ite((__VERIFIER_nondet_bool>0),0,1023))

4. Assumption :

5. Assertion :
(((2*_N1)+j)<1025)
Output for __VERIFIER_assert:
Output in prefix notation:
1. Frame axioms:
(= b1 b)
(= (cond1 cond) cond)

2. Output equations:
(= (_1_FAILED1 cond) (ite (<= cond 0) 1 0))
(= (__VERIFIER_assert cond) 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:
b1 = b
cond1(cond) = cond

2. Output equations:
_1_FAILED1(cond) = ite((cond<=0),1,0)
__VERIFIER_assert(cond) = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:2*_N1 + j < 1025
Counter Example
[i1 = 1,
 j1 = 1026,
 a = arraySort!val!0,
 a1 = arraySort!val!0,
 b = -2044,
 __VERIFIER_nondet_bool = 1,
 n1 = 0,
 k1 = True,
 j = 1024,
 _N1 = 1,
 main = 1,
 b1 = -2044,
 _f = [else ->
       If(Or(Var(0) >= 1, Not(Var(0) >= 0)), Var(0), 0)],
 k!44 = [else -> arraySort!val!0],
 d1array!47 = [(arraySort!val!0, 3) -> 9,
               (arraySort!val!0, 2) -> 12,
               (arraySort!val!0, 1027) -> 13,
               else -> 8],
 d1array1 = [else -> d1array1!46(k!44(Var(0)), k!45(Var(1)))],
 d1array = [else -> d1array!47(k!44(Var(0)), k!45(Var(1)))],
 k!45 = [else ->
         If(Var(0) >= -2044,
            If(Var(0) >= -2043,
               If(Var(0) >= 0,
                  If(Var(0) >= 1,
                     If(Var(0) >= 2,
                        If(Var(0) >= 3,
                           If(Var(0) >= 1026,
                              If(Var(0) >= 1027, 1027, 1026),
                              3),
                           2),
                        1),
                     0),
                  -2043),
               -2044),
            -2045)],
 d1array1!46 = [(arraySort!val!0, 0) -> 8,
                (arraySort!val!0, 3) -> 9,
                (arraySort!val!0, 2) -> 12,
                (arraySort!val!0, 1027) -> 13,
                else -> 0]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0