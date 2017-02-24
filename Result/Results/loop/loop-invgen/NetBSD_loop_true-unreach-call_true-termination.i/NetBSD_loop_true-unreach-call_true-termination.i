>>> file_name='sv-benchmarks/loop-invgen/NetBSD_loop_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_PROVE[];
  int _2_PROVE[];
  int MAXPATHLEN;
  int pathbuf_off;
  int bound_off;
  int glob2_p_off;
  int glob2_pathbuf_off;
  int glob2_pathlim_off;
  MAXPATHLEN = __VERIFIER_nondet_int();
  if ((MAXPATHLEN > 0) && (MAXPATHLEN < 2147483647))
  {
    pathbuf_off = 0;
    bound_off = (pathbuf_off + (MAXPATHLEN + 1)) - 1;
    glob2_pathbuf_off = pathbuf_off;
    glob2_pathlim_off = bound_off;
    glob2_p_off = glob2_pathbuf_off;
    while (glob2_p_off <= glob2_pathlim_off)
    {
      _1_PROVE[glob2_p_off] = 0 <= glob2_p_off;
      _2_PROVE[glob2_p_off] = glob2_p_off < (MAXPATHLEN + 1);
      glob2_p_off = glob2_p_off + 1;
    }

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
{ pathbuf_off:int _1_PROVE:array glob2_p_off:int RET:int glob2_pathlim_off:int g
lob2_pathbuf_off:int bound_off:int _2_PROVE:array MAXPATHLEN:int}
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
(= _2_PROVE1 _2_PROVE)

2. Output equations:
(= pathbuf_off1 (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet_int 2
147483647)) 0 pathbuf_off))
(= (d1array1 _x1 _x2) (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet
_int 2147483647)) (d1array3 _x1 _x2 _N1) (d1array _x1 _x2)))
(= glob2_p_off1 (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet_int 2
147483647)) (+ _N1 0) glob2_p_off))
(= glob2_pathbuf_off1 (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet
_int 2147483647)) 0 glob2_pathbuf_off))
(= glob2_pathlim_off1 (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet
_int 2147483647)) (- (+ 0 (+ __VERIFIER_nondet_int 1)) 1) glob2_pathlim_off))
(= main 0)
(= bound_off1 (ite (and (> __VERIFIER_nondet_int 0) (< __VERIFIER_nondet_int 214
7483647)) (- (+ 0 (+ __VERIFIER_nondet_int 1)) 1) bound_off))
(= MAXPATHLEN1 __VERIFIER_nondet_int)

3. Other axioms:
(= (d1array3 _x1 _x2 0) (d1array _x1 _x2))
(> (+ _N1 0) (- (+ 0 (+ __VERIFIER_nondet_int 1)) 1))
(implies (< _n1 _N1) (<= (+ _n1 0) (- (+ 0 (+ __VERIFIER_nondet_int 1)) 1)))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE
_2_PROVE1 = _2_PROVE

2. Output equations:
pathbuf_off1 = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<2147483
647)),0,pathbuf_off)
d1array1(_x1,_x2) = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<21
47483647)),d1array3(_x1,_x2,_N1),d1array(_x1,_x2))
glob2_p_off1 = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<2147483
647)),(_N1+0),glob2_p_off)
glob2_pathbuf_off1 = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<2
147483647)),0,glob2_pathbuf_off)
glob2_pathlim_off1 = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<2
147483647)),((0+(__VERIFIER_nondet_int+1))-1),glob2_pathlim_off)
main = 0
bound_off1 = ite(((__VERIFIER_nondet_int>0) and (__VERIFIER_nondet_int<214748364
7)),((0+(__VERIFIER_nondet_int+1))-1),bound_off)
MAXPATHLEN1 = __VERIFIER_nondet_int

3. Other axioms:
d1array3(_x1,_x2,0) = d1array(_x1,_x2)
((_N1+0)>((0+(__VERIFIER_nondet_int+1))-1))
(_n1<_N1) -> ((_n1+0)<=((0+(__VERIFIER_nondet_int+1))-1))

4. Assumption :

5. Assertion :
((_n1+0)<(__VERIFIER_nondet_int+1))
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

Assertion To Prove:ForAll([_n1],_n1 < __VERIFIER_nondet_int + 1)
Counter Example
[_2_PROVE = arraySort!val!1,
 glob2_pathbuf_off1 = 4,
 _1_PROVE = arraySort!val!0,
 _1_PROVE1 = arraySort!val!0,
 glob2_p_off = 3,
 bound_off1 = 6,
 _2_PROVE1 = arraySort!val!1,
 MAXPATHLEN1 = -1,
 main = 0,
 glob2_pathlim_off = 5,
 __VERIFIER_nondet_int = -1,
 glob2_pathlim_off1 = 5,
 bound_off = 6,
 pathbuf_off1 = 2,
 glob2_p_off1 = 3,
 _n1!0 = 0,
 pathbuf_off = 2,
 glob2_pathbuf_off = 4,
 _N1 = 0,
 elem!1 = arraySort!val!0,
 d1array1 = [else -> 5],
 _f = [else -> Var(0)],
 d1array = [else -> 5],
 d1array3 = [else -> 5]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0