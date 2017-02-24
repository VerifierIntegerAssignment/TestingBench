>>> file_name='sv-benchmarks/loops/array_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned SIZE = 1;
  unsigned j;
  unsigned k;
  int array[];
  int menor;
  menor = __VERIFIER_nondet_int();
  j = 0;
  while (j < SIZE)
  {
    array[j] = __VERIFIER_nondet_int();
    if (array[j] <= menor)
    {
      menor = array[j];
    }

    j = j + 1;
  }

  _1_PROVE = array[0] > menor;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ j:unsigned k:unsigned _1_PROVE:int RET:int menor:int array:array SIZE:unsigned
}
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
(= k1 k)
(= array1 array)

2. Output equations:
(= (d1array1 _x1 _x2) (d1array4 _x1 _x2 _N1))
(= j1 (+ _N1 0))
(= menor1 (menor4 _N1))
(= main 0)
(= SIZE1 1)

3. Other axioms:
(= (menor4 (+ _n1 1)) (ite (<= (ite (and (= array array) (= (+ _n1 0) (+ _n1 0))
) __VERIFIER_nondet_int (d1array4 array (+ _n1 0) _n1)) (menor4 _n1)) (ite (and
(= array array) (= (+ _n1 0) (+ _n1 0))) __VERIFIER_nondet_int (d1array4 array (
+ _n1 0) _n1)) (menor4 _n1)))
(= (d1array4 _x1 _x2 (+ _n1 1)) (ite (and (= _x1 array) (= _x2 (+ _n1 0))) __VER
IFIER_nondet_int (d1array4 _x1 _x2 _n1)))
(= (menor4 0) __VERIFIER_nondet_int)
(= (d1array4 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (- 1 0))
(implies (< _n1 _N1) (< (+ _n1 0) 1))

Output in normal notation:
1. Frame axioms:
k1 = k
array1 = array

2. Output equations:
d1array1(_x1,_x2) = d1array4(_x1,_x2,_N1)
j1 = (_N1+0)
menor1 = menor4(_N1)
main = 0
SIZE1 = 1

3. Other axioms:
menor4((_n1+1)) = ite((ite(((array=array) and ((_n1+0)=(_n1+0))),__VERIFIER_nond
et_int,d1array4(array,(_n1+0),_n1))<=menor4(_n1)),ite(((array=array) and ((_n1+0
)=(_n1+0))),__VERIFIER_nondet_int,d1array4(array,(_n1+0),_n1)),menor4(_n1))
d1array4(_x1,_x2,(_n1+1)) = ite(((_x1=array) and (_x2=(_n1+0))),__VERIFIER_nonde
t_int,d1array4(_x1,_x2,_n1))
menor4(0) = __VERIFIER_nondet_int
d1array4(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(1-0))
(_n1<_N1) -> ((_n1+0)<1)

4. Assumption :

5. Assertion :
(d1array4(array,0,_N1)>menor4(_N1))
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

Assertion To Prove:d1array4(array, 0, _N1) > menor4(_N1)
Counter Example
[__VERIFIER_nondet_int = 0,
 SIZE1 = 1,
 j1 = 1,
 k = 22,
 array1 = arraySort!val!0,
 menor1 = 0,
 k1 = 22,
 _N1 = 1,
 array = arraySort!val!0,
 main = 0,
 menor4 = [else -> 0],
 _f = [else -> Var(0)],
 d1array4 = [else -> 0],
 d1array1 = [(arraySort!val!0, 0) -> 0,
             else -> d1array4(Var(0), Var(1), 1)],
 d1array = [else -> d1array4(Var(0), Var(1), 0)]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0