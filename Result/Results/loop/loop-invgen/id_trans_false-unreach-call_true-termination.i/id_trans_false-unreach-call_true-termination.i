>>> file_name='sv-benchmarks/loop-invgen/id_trans_false-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _1_PROVE[];
  int _2_PROVE[];
  int _3_PROVE[];
  int _4_PROVE[];
  int idBitLength;
  int material_length;
  int nlen;
  int j;
  int k;
  nlen = __VERIFIER_nondet_int();
  idBitLength = __VERIFIER_nondet_int();
  material_length = __VERIFIER_nondet_int();
  _1_ASSUME = nlen == (idBitLength / 32);
  j = 0;
  while ((j < (idBitLength / 8)) && (j < material_length))
  {
    _1_PROVE[j] = 0 <= j;
    _2_PROVE[j] = j < material_length;
    _3_PROVE[j] = 0 <= (j / 4);
    _4_PROVE[j] = (j / 4) < nlen;
    j = j + 1;
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
{ j:int idBitLength:int k:int _1_PROVE:array _3_PROVE:array RET:int nlen:int _4_
PROVE:array _1_ASSUME:int _2_PROVE:array material_length:int}
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
(= _1_PROVE1 _1_PROVE)
(= _2_PROVE1 _2_PROVE)
(= _3_PROVE1 _3_PROVE)
(= _4_PROVE1 _4_PROVE)

2. Output equations:
(= j1 (+ _N1 0))
(= idBitLength1 __VERIFIER_nondet_int)
(= (d1array1 _x1 _x2) (d1array5 _x1 _x2 _N1))
(= main 0)
(= nlen1 __VERIFIER_nondet_int)
(= material_length1 __VERIFIER_nondet_int)

3. Other axioms:
(= (d1array5 _x1 _x2 0) (d1array _x1 _x2))
(or (>= (+ _N1 0) (/ __VERIFIER_nondet_int 8)) (>= (+ _N1 0) __VERIFIER_nondet_i
nt))
(implies (< _n1 _N1) (and (< (+ _n1 0) (/ __VERIFIER_nondet_int 8)) (< (+ _n1 0)
 __VERIFIER_nondet_int)))

Output in normal notation:
1. Frame axioms:
k1 = k
_1_PROVE1 = _1_PROVE
_2_PROVE1 = _2_PROVE
_3_PROVE1 = _3_PROVE
_4_PROVE1 = _4_PROVE

2. Output equations:
j1 = (_N1+0)
idBitLength1 = __VERIFIER_nondet_int
d1array1(_x1,_x2) = d1array5(_x1,_x2,_N1)
main = 0
nlen1 = __VERIFIER_nondet_int
material_length1 = __VERIFIER_nondet_int

3. Other axioms:
d1array5(_x1,_x2,0) = d1array(_x1,_x2)
(((_N1+0)>=(__VERIFIER_nondet_int/8)) or ((_N1+0)>=__VERIFIER_nondet_int))
(_n1<_N1) -> (((_n1+0)<(__VERIFIER_nondet_int/8)) and ((_n1+0)<__VERIFIER_nondet
_int))

4. Assumption :
(__VERIFIER_nondet_int==(__VERIFIER_nondet_int/32))

5. Assertion :
(((_n1+0)/4)<__VERIFIER_nondet_int)
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

Assertion To Prove:ForAll([_n1],((_n1/4)<__VERIFIER_nondet_int))
Counter Example
[idBitLength1 = 0,
 _2_PROVE = arraySort!val!1,
 k = 5,
 _4_PROVE1 = arraySort!val!3,
 _1_PROVE = arraySort!val!0,
 _1_PROVE1 = arraySort!val!0,
 nlen1 = 0,
 _2_PROVE1 = arraySort!val!1,
 main = 0,
 __VERIFIER_nondet_int = 0,
 j1 = 0,
 _3_PROVE1 = arraySort!val!2,
 _3_PROVE = arraySort!val!2,
 _4_PROVE = arraySort!val!3,
 _n1!0 = 152,
 k1 = 5,
 _N1 = 0,
 material_length1 = 0,
 d1array1 = [else -> d1array5(Var(0), Var(1), 0)],
 _f = [else -> Var(0)],
 d1array = [else -> d1array5(Var(0), Var(1), 0)],
 d1array5 = [else -> -38]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0