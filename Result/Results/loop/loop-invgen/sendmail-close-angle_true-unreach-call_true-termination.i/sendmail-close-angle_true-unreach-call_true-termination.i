>>> file_name='sv-benchmarks/loop-invgen/sendmail-close-angle_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int break_1_flag = 0;
  int RET = 0;
  int _6_PROVE = 0;
  int _1_PROVE = 0;
  int _3_PROVE = 0;
  int _4_PROVE = 0;
  int _5_PROVE = 0;
  int _7_PROVE = 0;
  int _8_PROVE = 0;
  int _2_PROVE = 0;
  int in_var;
  int inlen = __VERIFIER_nondet_int();
  int bufferlen = __VERIFIER_nondet_int();
  int buf;
  int buflim;
  if (bufferlen > 1)
  {
    if (inlen > 0)
    {
      if (bufferlen < inlen)
      {
        buf = 0;
        in_var = 0;
        buflim = bufferlen - 2;
        while ((__VERIFIER_nondet_int() > 0) && (break_1_flag == 0))
        {
          break_1_flag = 0;
          if (buf == buflim)
          {
            break_1_flag = 1;
          }

          if (break_1_flag == 0)
          {
            _1_PROVE = 0 <= buf;
            _2_PROVE = buf < bufferlen;
            buf = buf + 1;
            out:


            in_var = in_var + 1;
            _3_PROVE = 0 <= in_var;
            _4_PROVE = in_var < inlen;
          }

        }

        _5_PROVE = 0 <= buf;
        _6_PROVE = buf < bufferlen;
        buf = buf + 1;
        _7_PROVE = 0 <= buf;
        _8_PROVE = buf < bufferlen;
        buf = buf + 1;
      }

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
{ bufferlen:int buflim:int _6_PROVE:int buf:int _1_PROVE:int _3_PROVE:int _4_PRO
VE:int RET:int break_1_flag:int _5_PROVE:int _7_PROVE:int _8_PROVE:int _2_PROVE:
int in_var:int inlen:int}
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
(= bufferlen1 __VERIFIER_nondet_int)
(= buflim1 (ite (> __VERIFIER_nondet_int 1) (ite (> __VERIFIER_nondet_int 0) (it
e (< __VERIFIER_nondet_int __VERIFIER_nondet_int) (- __VERIFIER_nondet_int 2) bu
flim) buflim) buflim))
(= main 0)
(= break_1_flag1 (ite (> __VERIFIER_nondet_int 1) (ite (> __VERIFIER_nondet_int
0) (ite (< __VERIFIER_nondet_int __VERIFIER_nondet_int) (break_1_flag10 _N1) 0)
0) 0))
(= buf1 (ite (> __VERIFIER_nondet_int 1) (ite (> __VERIFIER_nondet_int 0) (ite (
< __VERIFIER_nondet_int __VERIFIER_nondet_int) (+ (+ (buf10 _N1) 1) 1) buf) buf)
 buf))
(= in_var1 (ite (> __VERIFIER_nondet_int 1) (ite (> __VERIFIER_nondet_int 0) (it
e (< __VERIFIER_nondet_int __VERIFIER_nondet_int) (in_var10 _N1) in_var) in_var)
 in_var))
(= inlen1 __VERIFIER_nondet_int)

3. Other axioms:
(= (buf10 (+ _n1 1)) (ite (== (ite (== (buf10 _n1) (- __VERIFIER_nondet_int 2))
1 0) 0) (+ (buf10 _n1) 1) (buf10 _n1)))
(= (break_1_flag10 (+ _n1 1)) (ite (== (buf10 _n1) (- __VERIFIER_nondet_int 2))
1 0))
(= (in_var10 (+ _n1 1)) (ite (== (ite (== (buf10 _n1) (- __VERIFIER_nondet_int 2
)) 1 0) 0) (+ (in_var10 _n1) 1) (in_var10 _n1)))
(= (buf10 0) 0)
(= (break_1_flag10 0) 0)
(= (in_var10 0) 0)
(or (<= __VERIFIER_nondet_int 0) (!= (break_1_flag10 _N1) 0))
(implies (< _n1 _N1) (and (> __VERIFIER_nondet_int 0) (== (break_1_flag10 _n1) 0
)))

Output in normal notation:
1. Frame axioms:

2. Output equations:
bufferlen1 = __VERIFIER_nondet_int
buflim1 = ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VER
IFIER_nondet_int<__VERIFIER_nondet_int),(__VERIFIER_nondet_int-2),buflim),buflim
),buflim)
main = 0
break_1_flag1 = ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite(
(__VERIFIER_nondet_int<__VERIFIER_nondet_int),break_1_flag10(_N1),0),0),0)
buf1 = ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VERIFI
ER_nondet_int<__VERIFIER_nondet_int),((buf10(_N1)+1)+1),buf),buf),buf)
in_var1 = ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VER
IFIER_nondet_int<__VERIFIER_nondet_int),in_var10(_N1),in_var),in_var),in_var)
inlen1 = __VERIFIER_nondet_int

3. Other axioms:
buf10((_n1+1)) = ite((ite((buf10(_n1)==(__VERIFIER_nondet_int-2)),1,0)==0),(buf1
0(_n1)+1),buf10(_n1))
break_1_flag10((_n1+1)) = ite((buf10(_n1)==(__VERIFIER_nondet_int-2)),1,0)
in_var10((_n1+1)) = ite((ite((buf10(_n1)==(__VERIFIER_nondet_int-2)),1,0)==0),(i
n_var10(_n1)+1),in_var10(_n1))
buf10(0) = 0
break_1_flag10(0) = 0
in_var10(0) = 0
((__VERIFIER_nondet_int<=0) or (break_1_flag10(_N1)!=0))
(_n1<_N1) -> ((__VERIFIER_nondet_int>0) and (break_1_flag10(_n1)==0))

4. Assumption :

5. Assertion :
ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nond
et_int<__VERIFIER_nondet_int),(buf10(_N1)<__VERIFIER_nondet_int),0),0),0)
ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nond
et_int<__VERIFIER_nondet_int),(0<=buf10(_N1)),0),0),0)
ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nond
et_int<__VERIFIER_nondet_int),(0<=(buf10(_N1)+1)),0),0),0)
ite((__VERIFIER_nondet_int>1),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nond
et_int<__VERIFIER_nondet_int),((buf10(_N1)+1)<__VERIFIER_nondet_int),0),0),0)
(0<=buf10(_n1))
(0<=(in_var10(_n1)+1))
((in_var10(_n1)+1)<__VERIFIER_nondet_int)
(buf10(_n1)<__VERIFIER_nondet_int)
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

Assertion To Prove:Implies(__VERIFIER_nondet_int > 1,Implies(__VERIFIER_nondet_i
nt > 0,Implies(__VERIFIER_nondet_int < __VERIFIER_nondet_int,buf10(_N1) < __VERI
FIER_nondet_int)))
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
0