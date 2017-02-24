>>> file_name='sv-benchmarks/loop-invgen/MADWiFi-encode_ie_ok_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int RET = 0;
  int _1_ASSUME = 0;
  int _2_ASSUME = 0;
  int _3_ASSUME = 0;
  int _1_PROVE[];
  int _2_PROVE[];
  int p;
  int i;
  int leader_len;
  int bufsize;
  int bufsize_0_var;
  int ielen;
  leader_len = __VERIFIER_nondet_int();
  bufsize = __VERIFIER_nondet_int();
  ielen = __VERIFIER_nondet_int();
  _1_ASSUME = leader_len < 1000000;
  _2_ASSUME = bufsize < 1000000;
  _3_ASSUME = ielen < 1000000;
  if (leader_len > 0)
  {
    if (bufsize > 0)
    {
      if (ielen > 0)
      {
        if (bufsize >= leader_len)
        {
          p = 0;
          bufsize_0_var = bufsize;
          bufsize = bufsize - leader_len;
          p = p + leader_len;
          if (bufsize >= (2 * ielen))
          {
            i = 0;
            while ((i < ielen) && (bufsize > 2))
            {
              _1_PROVE[i] = 0 <= p;
              _2_PROVE[i] = (p + 1) < bufsize_0_var;
              p = p + 2;
              i = i + 1;
            }

          }

        }

      }

    }

  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ leader_len:int p:int i:int _1_PROVE:array RET:int _2_ASSUME:int _3_ASSUME:int
_1_ASSUME:int bufsize_0_var:int bufsize:int _2_PROVE:array ielen:int}
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
(= leader_len1 __VERIFIER_nondet_int)
(= i1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>
__VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int __VERIFIER_nondet_int) (
ite (>= (- __VERIFIER_nondet_int __VERIFIER_nondet_int) (* 2 __VERIFIER_nondet_i
nt)) (+ _N1 0) i) i) i) i) i))
(= (d1array1 _x1 _x2) (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet
_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int __VERIFI
ER_nondet_int) (ite (>= (- __VERIFIER_nondet_int __VERIFIER_nondet_int) (* 2 __V
ERIFIER_nondet_int)) (d1array4 _x1 _x2 _N1) (d1array _x1 _x2)) (d1array _x1 _x2)
) (d1array _x1 _x2)) (d1array _x1 _x2)) (d1array _x1 _x2)))
(= main 0)
(= p1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>
__VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int __VERIFIER_nondet_int) (
ite (>= (- __VERIFIER_nondet_int __VERIFIER_nondet_int) (* 2 __VERIFIER_nondet_i
nt)) (+ (* 2 _N1) (+ 0 __VERIFIER_nondet_int)) (+ 0 __VERIFIER_nondet_int)) p) p
) p) p))
(= bufsize_0_var1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int
 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int __VERIFIER_n
ondet_int) __VERIFIER_nondet_int bufsize_0_var) bufsize_0_var) bufsize_0_var) bu
fsize_0_var))
(= bufsize1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (i
te (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int __VERIFIER_nondet_
int) (- __VERIFIER_nondet_int __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VE
RIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int))
(= ielen1 __VERIFIER_nondet_int)

3. Other axioms:
(= (d1array4 _x1 _x2 0) (d1array _x1 _x2))
(or (>= (+ _N1 0) __VERIFIER_nondet_int) (<= (- __VERIFIER_nondet_int __VERIFIER
_nondet_int) 2))
(implies (< _n1 _N1) (and (< (+ _n1 0) __VERIFIER_nondet_int) (> (- __VERIFIER_n
ondet_int __VERIFIER_nondet_int) 2)))

Output in normal notation:
1. Frame axioms:
_1_PROVE1 = _1_PROVE
_2_PROVE1 = _2_PROVE

2. Output equations:
leader_len1 = __VERIFIER_nondet_int
i1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER
_nondet_int>0),ite((__VERIFIER_nondet_int>=__VERIFIER_nondet_int),ite(((__VERIFI
ER_nondet_int-__VERIFIER_nondet_int)>=(2*__VERIFIER_nondet_int)),(_N1+0),i),i),i
),i),i)
d1array1(_x1,_x2) = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=__VERIFIER_nondet_int)
,ite(((__VERIFIER_nondet_int-__VERIFIER_nondet_int)>=(2*__VERIFIER_nondet_int)),
d1array4(_x1,_x2,_N1),d1array(_x1,_x2)),d1array(_x1,_x2)),d1array(_x1,_x2)),d1ar
ray(_x1,_x2)),d1array(_x1,_x2))
main = 0
p1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER
_nondet_int>0),ite((__VERIFIER_nondet_int>=__VERIFIER_nondet_int),ite(((__VERIFI
ER_nondet_int-__VERIFIER_nondet_int)>=(2*__VERIFIER_nondet_int)),((2*_N1)+(0+__V
ERIFIER_nondet_int)),(0+__VERIFIER_nondet_int)),p),p),p),p)
bufsize_0_var1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite
((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=__VERIFIER_nondet_int),__
VERIFIER_nondet_int,bufsize_0_var),bufsize_0_var),bufsize_0_var),bufsize_0_var)
bufsize1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VE
RIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=__VERIFIER_nondet_int),(__VERIF
IER_nondet_int-__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_i
nt),__VERIFIER_nondet_int),__VERIFIER_nondet_int)
ielen1 = __VERIFIER_nondet_int

3. Other axioms:
d1array4(_x1,_x2,0) = d1array(_x1,_x2)
(((_N1+0)>=__VERIFIER_nondet_int) or ((__VERIFIER_nondet_int-__VERIFIER_nondet_i
nt)<=2))
(_n1<_N1) -> (((_n1+0)<__VERIFIER_nondet_int) and ((__VERIFIER_nondet_int-__VERI
FIER_nondet_int)>2))

4. Assumption :
(__VERIFIER_nondet_int<1000000)
(__VERIFIER_nondet_int<1000000)
(__VERIFIER_nondet_int<1000000)

5. Assertion :
((((2*_n1)+(0+__VERIFIER_nondet_int))+1)<__VERIFIER_nondet_int)
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

Assertion To Prove:ForAll([_n1],__VERIFIER_nondet_int + 2*_n1 + 1 < __VERIFIER_n
ondet_int)
Counter Example
[i1 = 1,
 p = 2,
 _2_PROVE = arraySort!val!1,
 p1 = 2,
 _1_PROVE = arraySort!val!0,
 _1_PROVE1 = arraySort!val!0,
 _2_PROVE1 = arraySort!val!1,
 main = 0,
 __VERIFIER_nondet_int = 0,
 i = 1,
 bufsize1 = 0,
 ielen1 = 0,
 leader_len1 = 0,
 bufsize_0_var1 = 3,
 _n1!0 = 0,
 _N1 = 0,
 bufsize_0_var = 3,
 d1array1 = [else -> d1array(Var(0), Var(1))],
 _f = [else -> Var(0)],
 d1array = [else -> 2],
 d1array4 = [else -> d1array(Var(0), Var(1))]]


Function Name--__VERIFIER_assert
No Assertion to Prove
0