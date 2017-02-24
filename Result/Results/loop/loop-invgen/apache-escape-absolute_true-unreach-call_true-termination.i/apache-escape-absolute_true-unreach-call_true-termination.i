>>> file_name='sv-benchmarks/loop-invgen/apache-escape-absolute_true-unreach-call_true-termination.i'
>>> prove_auto(file_name)
Program Body
{
  int break_1_flag = 0;
  int RET = 0;
  int _17_PROVE[];
  int _10_PROVE = 0;
  int _11_PROVE = 0;
  int _12_PROVE = 0;
  int _15_PROVE[];
  int _6_PROVE[];
  int _1_PROVE = 0;
  int _14_PROVE[];
  int _3_PROVE = 0;
  int _4_PROVE = 0;
  int _16_PROVE[];
  int _2_ASSUME = 0;
  int _3_ASSUME = 0;
  int _9_PROVE = 0;
  int _13_PROVE[];
  int _5_PROVE[];
  int _1_ASSUME = 0;
  int _7_PROVE = 0;
  int _8_PROVE = 0;
  int _2_PROVE = 0;
  int _18_PROVE[];
  int scheme;
  int urilen;
  int tokenlen;
  int cp;
  int c;
  urilen = __VERIFIER_nondet_int();
  tokenlen = __VERIFIER_nondet_int();
  scheme = __VERIFIER_nondet_int();
  _1_ASSUME = (urilen <= 1000000) && (urilen >= (-1000000));
  _2_ASSUME = (tokenlen <= 1000000) && (tokenlen >= (-1000000));
  _3_ASSUME = (scheme <= 1000000) && (scheme >= (-1000000));
  if (urilen > 0)
  {
    if (tokenlen > 0)
    {
      if (scheme >= 0)
      {
        if ((scheme != 0) && ((urilen - 1) >= scheme))
        {
          cp = scheme;
          _1_PROVE = (cp - 1) < urilen;
          _2_PROVE = 0 <= (cp - 1);
          if (__VERIFIER_nondet_int() > 0)
          {
            _3_PROVE = cp < urilen;
            _4_PROVE = 0 <= cp;
            while ((cp != (urilen - 1)) && (break_1_flag == 0))
            {
              break_1_flag = 0;
              if (__VERIFIER_nondet_int() > 0)
              {
                break_1_flag = 1;
              }

              if (break_1_flag == 0)
              {
                _5_PROVE[cp] = cp < urilen;
                _6_PROVE[cp] = 0 <= cp;
                cp = cp + 1;
              }

            }

            _7_PROVE = cp < urilen;
            _8_PROVE = 0 <= cp;
            if (cp != (urilen - 1))
            {
              _9_PROVE = (cp + 1) < urilen;
              _10_PROVE = 0 <= (cp + 1);
              if ((cp + 1) != (urilen - 1))
              {
                cp = cp + 1;
                scheme = cp;
                if (__VERIFIER_nondet_int() > 0)
                {
                  c = 0;
                  _11_PROVE = cp < urilen;
                  _12_PROVE = 0 <= cp;
                  while ((cp != (urilen - 1)) && (c < (tokenlen - 1)))
                  {
                    _13_PROVE[cp] = cp < urilen;
                    _14_PROVE[cp] = 0 <= cp;
                    if (__VERIFIER_nondet_int() > 0)
                    {
                      c = c + 1;
                      _15_PROVE[cp] = c < tokenlen;
                      _16_PROVE[cp] = 0 <= c;
                      _17_PROVE[cp] = cp < urilen;
                      _18_PROVE[cp] = 0 <= cp;
                    }

                    cp = cp + 1;
                  }

                }

              }

            }

          }

        }

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
{ _6_PROVE:array _11_PROVE:int RET:int _4_PROVE:int break_1_flag:int cp:int tokenlen:int _17_PROVE:array _12_PROVE:int _1_PROVE:int _3_PROVE:int _14_PROVE:array _9_PROVE:int scheme:int _10_PROVE:int _2_ASSUME:int _3_ASSUME:int _13_PROVE:array _7_PROVE:int _2_PROVE:int _18_PROVE:array c:int _15_PROVE:array urilen:int _16_PROVE:array _5_PROVE:array _1_ASSUME:int _8_PROVE:int}
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
(= _17_PROVE1 _17_PROVE)
(= _15_PROVE1 _15_PROVE)
(= _6_PROVE1 _6_PROVE)
(= _14_PROVE1 _14_PROVE)
(= _16_PROVE1 _16_PROVE)
(= _13_PROVE1 _13_PROVE)
(= _5_PROVE1 _5_PROVE)
(= _18_PROVE1 _18_PROVE)

2. Output equations:
(= c1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int 0) (ite (and (!= __VERIFIER_nondet_int 0) (>= (- __VERIFIER_nondet_int 1) __VERIFIER_nondet_int)) (ite (> __VERIFIER_nondet_int 0) (ite (!= (cp7 _N1) (- __VERIFIER_nondet_int 1)) (ite (!= (+ (cp7 _N1) 1) (- __VERIFIER_nondet_int 1)) (ite (> __VERIFIER_nondet_int 0) (c16 _N2) c) c) c) c) c) c) c) c))
(= cp1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int 0) (ite (and (!= __VERIFIER_nondet_int 0) (>= (- __VERIFIER_nondet_int 1) __VERIFIER_nondet_int)) (ite (> __VERIFIER_nondet_int 0) (ite (!= (cp7 _N1) (- __VERIFIER_nondet_int 1)) (ite (!= (+ (cp7 _N1) 1) (- __VERIFIER_nondet_int 1)) (ite (> __VERIFIER_nondet_int 0) (+ _N2 (+ (cp7 _N1) 1)) (+ (cp7 _N1) 1)) (cp7 _N1)) (cp7 _N1)) __VERIFIER_nondet_int) cp) cp) cp) cp))
(= (d1array1 _x1 _x2) (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int 0) (ite (and (!= __VERIFIER_nondet_int 0) (>= (- __VERIFIER_nondet_int 1) __VERIFIER_nondet_int)) (ite (> __VERIFIER_nondet_int 0) (ite (!= (cp7 _N1) (- __VERIFIER_nondet_int 1)) (ite (!= (+ (cp7 _N1) 1) (- __VERIFIER_nondet_int 1)) (ite (> __VERIFIER_nondet_int 0) (d1array16 _x1 _x2 _N2) (d1array7 _x1 _x2 _N1)) (d1array7 _x1 _x2 _N1)) (d1array7 _x1 _x2 _N1)) (d1array _x1 _x2)) (d1array _x1 _x2)) (d1array _x1 _x2)) (d1array _x1 _x2)) (d1array _x1 _x2)))
(= urilen1 __VERIFIER_nondet_int)
(= main 0)
(= break_1_flag1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int 0) (ite (and (!= __VERIFIER_nondet_int 0) (>= (- __VERIFIER_nondet_int 1) __VERIFIER_nondet_int)) (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) 1 0) 0) 0) 0) 0) 0))
(= scheme1 (ite (> __VERIFIER_nondet_int 0) (ite (> __VERIFIER_nondet_int 0) (ite (>= __VERIFIER_nondet_int 0) (ite (and (!= __VERIFIER_nondet_int 0) (>= (- __VERIFIER_nondet_int 1) __VERIFIER_nondet_int)) (ite (> __VERIFIER_nondet_int 0) (ite (!= (cp7 _N1) (- __VERIFIER_nondet_int 1)) (ite (!= (+ (cp7 _N1) 1) (- __VERIFIER_nondet_int 1)) (+ (cp7 _N1) 1) __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int) __VERIFIER_nondet_int))
(= tokenlen1 __VERIFIER_nondet_int)

3. Other axioms:
(= (cp7 (+ _n1 1)) (ite (== (ite (> __VERIFIER_nondet_int 0) 1 0) 0) (+ (cp7 _n1) 1) (cp7 _n1)))
(= (cp7 0) __VERIFIER_nondet_int)
(= (d1array7 _x1 _x2 0) (d1array _x1 _x2))
(or (== (cp7 _N1) (- __VERIFIER_nondet_int 1)) (!= (ite (> __VERIFIER_nondet_int 0) 1 0) 0))
(implies (< _n1 _N1) (and (!= (cp7 _n1) (- __VERIFIER_nondet_int 1)) (== (ite (> __VERIFIER_nondet_int 0) 1 0) 0)))
(= (c16 (+ _n2 1)) (ite (> __VERIFIER_nondet_int 0) (+ (c16 _n2) 1) (c16 _n2)))
(= (c16 0) 0)
(= (d1array16 _x1 _x2 0) (d1array7 _x1 _x2 _N1))
(or (== (+ _N2 (+ (cp7 _N1) 1)) (- __VERIFIER_nondet_int 1)) (>= (c16 _N2) (- __VERIFIER_nondet_int 1)))
(implies (< _n2 _N2) (and (!= (+ _n2 (+ (cp7 _N1) 1)) (- __VERIFIER_nondet_int 1)) (< (c16 _n2) (- __VERIFIER_nondet_int 1))))

Output in normal notation:
1. Frame axioms:
_17_PROVE1 = _17_PROVE
_15_PROVE1 = _15_PROVE
_6_PROVE1 = _6_PROVE
_14_PROVE1 = _14_PROVE
_16_PROVE1 = _16_PROVE
_13_PROVE1 = _13_PROVE
_5_PROVE1 = _5_PROVE
_18_PROVE1 = _18_PROVE

2. Output equations:
c1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),ite((__VERIFIER_nondet_int>0),c16(_N2),c),c),c),c),c),c),c),c)
cp1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),ite((__VERIFIER_nondet_int>0),(_N2+(cp7(_N1)+1)),(cp7(_N1)+1)),cp7(_N1)),cp7(_N1)),__VERIFIER_nondet_int),cp),cp),cp),cp)
d1array1(_x1,_x2) = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),ite((__VERIFIER_nondet_int>0),d1array16(_x1,_x2,_N2),d1array7(_x1,_x2,_N1)),d1array7(_x1,_x2,_N1)),d1array7(_x1,_x2,_N1)),d1array(_x1,_x2)),d1array(_x1,_x2)),d1array(_x1,_x2)),d1array(_x1,_x2)),d1array(_x1,_x2))
urilen1 = __VERIFIER_nondet_int
main = 0
break_1_flag1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),1,0),0),0),0),0),0)
scheme1 = ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),(cp7(_N1)+1),__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_int),__VERIFIER_nondet_int)
tokenlen1 = __VERIFIER_nondet_int

3. Other axioms:
cp7((_n1+1)) = ite((ite((__VERIFIER_nondet_int>0),1,0)==0),(cp7(_n1)+1),cp7(_n1))
cp7(0) = __VERIFIER_nondet_int
d1array7(_x1,_x2,0) = d1array(_x1,_x2)
((cp7(_N1)==(__VERIFIER_nondet_int-1)) or (ite((__VERIFIER_nondet_int>0),1,0)!=0))
(_n1<_N1) -> ((cp7(_n1)!=(__VERIFIER_nondet_int-1)) and (ite((__VERIFIER_nondet_int>0),1,0)==0))
c16((_n2+1)) = ite((__VERIFIER_nondet_int>0),(c16(_n2)+1),c16(_n2))
c16(0) = 0
d1array16(_x1,_x2,0) = d1array7(_x1,_x2,_N1)
(((_N2+(cp7(_N1)+1))==(__VERIFIER_nondet_int-1)) or (c16(_N2)>=(__VERIFIER_nondet_int-1)))
(_n2<_N2) -> (((_n2+(cp7(_N1)+1))!=(__VERIFIER_nondet_int-1)) and (c16(_n2)<(__VERIFIER_nondet_int-1)))

4. Assumption :
((__VERIFIER_nondet_int<=1000000) and (__VERIFIER_nondet_int>=-(1000000)))
((__VERIFIER_nondet_int<=1000000) and (__VERIFIER_nondet_int>=-(1000000)))
((__VERIFIER_nondet_int<=1000000) and (__VERIFIER_nondet_int>=-(1000000)))

5. Assertion :
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),(0<=(cp7(_N1)+1)),0),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),((__VERIFIER_nondet_int-1)<__VERIFIER_nondet_int),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),ite((__VERIFIER_nondet_int>0),(0<=(cp7(_N1)+1)),0),0),0),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),ite(((cp7(_N1)+1)!=(__VERIFIER_nondet_int-1)),ite((__VERIFIER_nondet_int>0),((cp7(_N1)+1)<__VERIFIER_nondet_int),0),0),0),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),(0<=(__VERIFIER_nondet_int-1)),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),(__VERIFIER_nondet_int<__VERIFIER_nondet_int),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),(0<=__VERIFIER_nondet_int),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),ite((cp7(_N1)!=(__VERIFIER_nondet_int-1)),((cp7(_N1)+1)<__VERIFIER_nondet_int),0),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),(cp7(_N1)<__VERIFIER_nondet_int),0),0),0),0),0)
ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>0),ite((__VERIFIER_nondet_int>=0),ite(((__VERIFIER_nondet_int!=0) and ((__VERIFIER_nondet_int-1)>=__VERIFIER_nondet_int)),ite((__VERIFIER_nondet_int>0),(0<=cp7(_N1)),0),0),0),0),0)
ite(((_x1=_6_PROVE) and (_x2=cp7(_n1))),(0<=cp7(_n1)),ite(((_x1=_5_PROVE) and (_x2=cp7(_n1))),(cp7(_n1)<__VERIFIER_nondet_int),d1array7(_x1,_x2,_n1)))
ite(((_x1=_18_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),(0<=(_n2+(cp7(_N1)+1))),ite(((_x1=_17_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),((_n2+(cp7(_N1)+1))<__VERIFIER_nondet_int),ite(((_x1=_16_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),(0<=(c16(_n2)+1)),ite(((_x1=_15_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),((c16(_n2)+1)<__VERIFIER_nondet_int),ite(((_x1=_14_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),(0<=(_n2+(cp7(_N1)+1))),ite(((_x1=_13_PROVE) and (_x2=(_n2+(cp7(_N1)+1)))),((_n2+(cp7(_N1)+1))<__VERIFIER_nondet_int),d1array16(_x1,_x2,_n2)))))))
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

Assertion To Prove:Implies(__VERIFIER_nondet_int > 0,Implies(__VERIFIER_nondet_int > 0,Implies(__VERIFIER_nondet_int >= 0,Implies(And((__VERIFIER_nondet_int!=0),__VERIFIER_nondet_int - 1 >= __VERIFIER_nondet_int),Implies(__VERIFIER_nondet_int > 0,Implies(cp7(_N1)!=__VERIFIER_nondet_int - 1,0 <= cp7(_N1) + 1))))))
Successfully Proved

Function Name--__VERIFIER_assert
No Assertion to Prove
1
