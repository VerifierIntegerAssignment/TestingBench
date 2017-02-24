>>> file_name='sv-benchmarks/loops/matrix_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE = 0;
  unsigned N_LIN = 1;
  unsigned N_COL = 1;
  unsigned j;
  unsigned k;
  int matriz[][];
  int maior;
  maior = __VERIFIER_nondet_int();
  j = 0;
  while (j < N_COL)
  {
    k = 0;
    while (k < N_LIN)
    {
      matriz[j][k] = __VERIFIER_nondet_int();
      if (matriz[j][k] >= maior)
      {
        maior = matriz[j][k];
      }

      k = k + 1;
    }

    j = j + 1;
  }

  _1_PROVE = matriz[0][0] <= maior;
  RET = 0;
}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ j:unsigned matriz:array k:unsigned _1_PROVE:int maior:int RET:int N_COL:unsign
ed N_LIN:unsigned}
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
(= matriz1 matriz)

2. Output equations:
(= k1 (k7 _N2))
(= j1 (+ _N2 0))
(= maior1 (maior7 _N2))
(= (d2array1 _x1 _x2 _x3) (d2array7 _x1 _x2 _x3 _N2))
(= main 0)
(= N_COL1 1)
(= N_LIN1 1)

3. Other axioms:
(= (maior4 (+ _n1 1) _n2) (ite (>= (ite (and (= matriz matriz) (= (+ _n2 0) (+ _
n2 0)) (= (+ _n1 0) (+ _n1 0))) __VERIFIER_nondet_int (d2array4 matriz (+ _n2 0)
 (+ _n1 0) _n1 _n2)) (maior4 _n1 _n2)) (ite (and (= matriz matriz) (= (+ _n2 0)
(+ _n2 0)) (= (+ _n1 0) (+ _n1 0))) __VERIFIER_nondet_int (d2array4 matriz (+ _n
2 0) (+ _n1 0) _n1 _n2)) (maior4 _n1 _n2)))
(= (d2array4 _x1 _x2 _x3 (+ _n1 1) _n2) (ite (and (= _x1 matriz) (= _x2 (+ _n2 0
)) (= _x3 (+ _n1 0))) __VERIFIER_nondet_int (d2array4 _x1 _x2 _x3 _n1 _n2)))
(= (maior4 0 _n2) (maior7 _n2))
(= (d2array4 _x1 _x2 _x3 0 _n2) (d2array7 _x1 _x2 _x3 _n2))
(>= (_N1 _n2) (- 1 0))
(implies (< _n1 (_N1 _n2)) (< (+ _n1 0) 1))
(= (k7 (+ _n2 1)) (+ (_N1 _n2) 0))
(= (maior7 (+ _n2 1)) (maior4 (_N1 _n2) _n2))
(= (d2array7 _x1 _x2 _x3 (+ _n2 1)) (d2array4 _x1 _x2 _x3 (_N1 _n2) _n2))
(= (k7 0) k)
(= (maior7 0) __VERIFIER_nondet_int)
(= (d2array7 _x1 _x2 _x3 0) (d2array _x1 _x2 _x3))
(>= _N2 (- 1 0))
(implies (< _n2 _N2) (< (+ _n2 0) 1))

Output in normal notation:
1. Frame axioms:
matriz1 = matriz

2. Output equations:
k1 = k7(_N2)
j1 = (_N2+0)
maior1 = maior7(_N2)
d2array1(_x1,_x2,_x3) = d2array7(_x1,_x2,_x3,_N2)
main = 0
N_COL1 = 1
N_LIN1 = 1

3. Other axioms:
maior4((_n1+1),_n2) = ite((ite(((matriz=matriz) and ((_n2+0)=(_n2+0)) and ((_n1+
0)=(_n1+0))),__VERIFIER_nondet_int,d2array4(matriz,(_n2+0),(_n1+0),_n1,_n2))>=ma
ior4(_n1,_n2)),ite(((matriz=matriz) and ((_n2+0)=(_n2+0)) and ((_n1+0)=(_n1+0)))
,__VERIFIER_nondet_int,d2array4(matriz,(_n2+0),(_n1+0),_n1,_n2)),maior4(_n1,_n2)
)
d2array4(_x1,_x2,_x3,(_n1+1),_n2) = ite(((_x1=matriz) and (_x2=(_n2+0)) and (_x3
=(_n1+0))),__VERIFIER_nondet_int,d2array4(_x1,_x2,_x3,_n1,_n2))
maior4(0,_n2) = maior7(_n2)
d2array4(_x1,_x2,_x3,0,_n2) = d2array7(_x1,_x2,_x3,_n2)
(_N1(_n2)>=(1-0))
(_n1<_N1(_n2)) -> ((_n1+0)<1)
k7((_n2+1)) = (_N1(_n2)+0)
maior7((_n2+1)) = maior4(_N1(_n2),_n2)
d2array7(_x1,_x2,_x3,(_n2+1)) = d2array4(_x1,_x2,_x3,_N1(_n2),_n2)
k7(0) = k
maior7(0) = __VERIFIER_nondet_int
d2array7(_x1,_x2,_x3,0) = d2array(_x1,_x2,_x3)
(_N2>=(1-0))
(_n2<_N2) -> ((_n2+0)<1)

4. Assumption :

5. Assertion :
(d2array7(matriz,0,0,_N2)<=maior7(_N2))
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

Assertion To Prove:d2array7(matriz, 0, 0, _N2) <= maior7(_N2)
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0