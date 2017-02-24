    else
    {
      distance[i] = INFINITY;
    }

    i = i + 1;
  }

  i = 0;
  while (i < nodecount)
  {
    j = 0;
    while (j < edgecount)
    {
      x = Dest[j];
      y = Source[j];
      if (distance[x] > (distance[y] + Weight[j]))
      {
        distance[x] = -1;
      }

      j = j + 1;
    }

    i = i + 1;
  }

  i = 0;
  while ((i < edgecount) && (break_1_flag == 0))
  {
    break_1_flag = 0;
    x = Dest[i];
    y = Source[i];
    if (distance[x] > (distance[y] + Weight[i]))
    {
      RET = 0;
    }

    if (distance[x] <= (distance[y] + Weight[i]))
    {
      i = i + 1;
    }

    if (distance[x] > (distance[y] + Weight[i]))
    {
      break_1_flag = 1;
    }

  }

  if (distance[x] <= (distance[y] + Weight[i]))
  {
    i = 0;
    while (i < nodecount)
    {
      _1_PROVE[i] = distance[i] >= 0;
      i = i + 1;
    }

    RET = 0;
  }

}

Function Name:
main
Return Type:
int
Input Variables:
{}
Local Variables:
{ distance:array j:int INFINITY:int edgecount:int Weight:array source:int Source
:array nodecount:int _1_PROVE:array RET:int y:int _2_ASSUME:int Dest:array break
_1_flag:int _1_ASSUME:int x:int i:int}
Program Body
{
  int INFINITY;
  INFINITY = 899;
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
{ _1_FAILED:int INFINITY:int RET:int}
Output for main:
Output in prefix notation:
1. Frame axioms:
(= Dest1 Dest)
(= distance1 distance)
(= _1_PROVE1 _1_PROVE)
(= Weight1 Weight)
(= Source1 Source)

2. Output equations:
(= j1 (j12 _N3))
(= INFINITY1 899)
(= edgecount1 __VERIFIER_nondet_int)
(= i1 (ite (<= (d1array12 distance (x21 _N4) _N3) (+ (d1array12 distance (y21 _N
4) _N3) (d1array12 Weight (i21 _N4) _N3))) (+ _N5 0) (i21 _N4)))
(= (d1array1 _x1 _x2) (ite (<= (d1array12 distance (x21 _N4) _N3) (+ (d1array12
distance (y21 _N4) _N3) (d1array12 Weight (i21 _N4) _N3))) (d1array23 _x1 _x2 _N
5) (d1array12 _x1 _x2 _N3)))
(= main (ite (<= (d1array12 distance (x21 _N4) _N3) (+ (d1array12 distance (y21
_N4) _N3) (d1array12 Weight (i21 _N4) _N3))) 0 (RET21 _N4)))
(= y1 (y21 _N4))
(= source1 0)
(= break_1_flag1 (break_1_flag21 _N4))
(= nodecount1 __VERIFIER_nondet_int)
(= x1 (x21 _N4))

3. Other axioms:
(= (d1array4 _x1 _x2 (+ _n1 1)) (ite (== (+ _n1 0) 0) (ite (and (= _x1 distance)
 (= _x2 (+ _n1 0))) 0 (d1array4 _x1 _x2 _n1)) (ite (and (= _x1 distance) (= _x2
(+ _n1 0))) 899 (d1array4 _x1 _x2 _n1))))
(= (d1array4 _x1 _x2 0) (d1array _x1 _x2))
(>= _N1 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n1 _N1) (< (+ _n1 0) __VERIFIER_nondet_int))
(= (y9 (+ _n2 1) _n3) (d1array9 Source (+ _n2 0) _n2 _n3))
(= (x9 (+ _n2 1) _n3) (d1array9 Dest (+ _n2 0) _n2 _n3))
(= (d1array9 _x1 _x2 (+ _n2 1) _n3) (ite (> (d1array9 distance (d1array9 Dest (+
 _n2 0) _n2 _n3) _n2 _n3) (+ (d1array9 distance (d1array9 Source (+ _n2 0) _n2 _
n3) _n2 _n3) (d1array9 Weight (+ _n2 0) _n2 _n3))) (ite (and (= _x1 distance) (=
 _x2 (d1array9 Dest (+ _n2 0) _n2 _n3))) (- 1) (d1array9 _x1 _x2 _n2 _n3)) (d1ar
ray9 _x1 _x2 _n2 _n3)))
(= (y9 0 _n3) (y12 _n3))
(= (x9 0 _n3) (x12 _n3))
(= (d1array9 _x1 _x2 0 _n3) (d1array12 _x1 _x2 _n3))
(>= (_N2 _n3) (- __VERIFIER_nondet_int 0))
(implies (< _n2 (_N2 _n3)) (< (+ _n2 0) __VERIFIER_nondet_int))
(= (y12 (+ _n3 1)) (y9 (_N2 _n3) _n3))
(= (d1array12 _x1 _x2 (+ _n3 1)) (d1array9 _x1 _x2 (_N2 _n3) _n3))
(= (j12 (+ _n3 1)) (+ (_N2 _n3) 0))
(= (x12 (+ _n3 1)) (x9 (_N2 _n3) _n3))
(= (y12 0) y)
(= (d1array12 _x1 _x2 0) (d1array4 _x1 _x2 _N1))
(= (j12 0) j)
(= (x12 0) x)
(>= _N3 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n3 _N3) (< (+ _n3 0) __VERIFIER_nondet_int))
(= (i21 (+ _n4 1)) (ite (<= (d1array12 distance (d1array12 Dest (i21 _n4) _N3) _
N3) (+ (d1array12 distance (d1array12 Source (i21 _n4) _N3) _N3) (d1array12 Weig
ht (i21 _n4) _N3))) (+ (i21 _n4) 1) (i21 _n4)))
(= (y21 (+ _n4 1)) (d1array12 Source (i21 _n4) _N3))
(= (RET21 (+ _n4 1)) (ite (> (d1array12 distance (d1array12 Dest (i21 _n4) _N3)
_N3) (+ (d1array12 distance (d1array12 Source (i21 _n4) _N3) _N3) (d1array12 Wei
ght (i21 _n4) _N3))) 0 (RET21 _n4)))
(= (break_1_flag21 (+ _n4 1)) (ite (> (d1array12 distance (d1array12 Dest (i21 _
n4) _N3) _N3) (+ (d1array12 distance (d1array12 Source (i21 _n4) _N3) _N3) (d1ar
ray12 Weight (ite (<= (d1array12 distance (d1array12 Dest (i21 _n4) _N3) _N3) (+
 (d1array12 distance (d1array12 Source (i21 _n4) _N3) _N3) (d1array12 Weight (i2
1 _n4) _N3))) (+ (i21 _n4) 1) (i21 _n4)) _N3))) 1 0))
(= (x21 (+ _n4 1)) (d1array12 Dest (i21 _n4) _N3))
(= (i21 0) 0)
(= (y21 0) (y12 _N3))
(= (RET21 0) 0)
(= (break_1_flag21 0) 0)
(= (x21 0) (x12 _N3))
(or (>= (i21 _N4) __VERIFIER_nondet_int) (!= (break_1_flag21 _N4) 0))
(implies (< _n4 _N4) (and (< (i21 _n4) __VERIFIER_nondet_int) (== (break_1_flag2
1 _n4) 0)))
(= (d1array23 _x1 _x2 0) (d1array12 _x1 _x2 _N3))
(>= _N5 (+ (- 0) __VERIFIER_nondet_int))
(implies (< _n5 _N5) (< (+ _n5 0) __VERIFIER_nondet_int))

Output in normal notation:
1. Frame axioms:
Dest1 = Dest
distance1 = distance
_1_PROVE1 = _1_PROVE
Weight1 = Weight
Source1 = Source

2. Output equations:
j1 = j12(_N3)
INFINITY1 = 899
edgecount1 = __VERIFIER_nondet_int
i1 = ite((d1array12(distance,x21(_N4),_N3)<=(d1array12(distance,y21(_N4),_N3)+d1
array12(Weight,i21(_N4),_N3))),(_N5+0),i21(_N4))
d1array1(_x1,_x2) = ite((d1array12(distance,x21(_N4),_N3)<=(d1array12(distance,y
21(_N4),_N3)+d1array12(Weight,i21(_N4),_N3))),d1array23(_x1,_x2,_N5),d1array12(_
x1,_x2,_N3))
main = ite((d1array12(distance,x21(_N4),_N3)<=(d1array12(distance,y21(_N4),_N3)+
d1array12(Weight,i21(_N4),_N3))),0,RET21(_N4))
y1 = y21(_N4)
source1 = 0
break_1_flag1 = break_1_flag21(_N4)
nodecount1 = __VERIFIER_nondet_int
x1 = x21(_N4)

3. Other axioms:
d1array4(_x1,_x2,(_n1+1)) = ite(((_n1+0)==0),ite(((_x1=distance) and (_x2=(_n1+0
))),0,d1array4(_x1,_x2,_n1)),ite(((_x1=distance) and (_x2=(_n1+0))),899,d1array4
(_x1,_x2,_n1)))
d1array4(_x1,_x2,0) = d1array(_x1,_x2)
(_N1>=(-(0)+__VERIFIER_nondet_int))
(_n1<_N1) -> ((_n1+0)<__VERIFIER_nondet_int)
y9((_n2+1),_n3) = d1array9(Source,(_n2+0),_n2,_n3)
x9((_n2+1),_n3) = d1array9(Dest,(_n2+0),_n2,_n3)
d1array9(_x1,_x2,(_n2+1),_n3) = ite((d1array9(distance,d1array9(Dest,(_n2+0),_n2
,_n3),_n2,_n3)>(d1array9(distance,d1array9(Source,(_n2+0),_n2,_n3),_n2,_n3)+d1ar
ray9(Weight,(_n2+0),_n2,_n3))),ite(((_x1=distance) and (_x2=d1array9(Dest,(_n2+0
),_n2,_n3))),-(1),d1array9(_x1,_x2,_n2,_n3)),d1array9(_x1,_x2,_n2,_n3))
y9(0,_n3) = y12(_n3)
x9(0,_n3) = x12(_n3)
d1array9(_x1,_x2,0,_n3) = d1array12(_x1,_x2,_n3)
(_N2(_n3)>=(__VERIFIER_nondet_int-0))
(_n2<_N2(_n3)) -> ((_n2+0)<__VERIFIER_nondet_int)
y12((_n3+1)) = y9(_N2(_n3),_n3)
d1array12(_x1,_x2,(_n3+1)) = d1array9(_x1,_x2,_N2(_n3),_n3)
j12((_n3+1)) = (_N2(_n3)+0)
x12((_n3+1)) = x9(_N2(_n3),_n3)
y12(0) = y
d1array12(_x1,_x2,0) = d1array4(_x1,_x2,_N1)
j12(0) = j
x12(0) = x
(_N3>=(-(0)+__VERIFIER_nondet_int))
(_n3<_N3) -> ((_n3+0)<__VERIFIER_nondet_int)
i21((_n4+1)) = ite((d1array12(distance,d1array12(Dest,i21(_n4),_N3),_N3)<=(d1arr
ay12(distance,d1array12(Source,i21(_n4),_N3),_N3)+d1array12(Weight,i21(_n4),_N3)
)),(i21(_n4)+1),i21(_n4))
y21((_n4+1)) = d1array12(Source,i21(_n4),_N3)
RET21((_n4+1)) = ite((d1array12(distance,d1array12(Dest,i21(_n4),_N3),_N3)>(d1ar
ray12(distance,d1array12(Source,i21(_n4),_N3),_N3)+d1array12(Weight,i21(_n4),_N3
))),0,RET21(_n4))
break_1_flag21((_n4+1)) = ite((d1array12(distance,d1array12(Dest,i21(_n4),_N3),_
N3)>(d1array12(distance,d1array12(Source,i21(_n4),_N3),_N3)+d1array12(Weight,ite
((d1array12(distance,d1array12(Dest,i21(_n4),_N3),_N3)<=(d1array12(distance,d1ar
ray12(Source,i21(_n4),_N3),_N3)+d1array12(Weight,i21(_n4),_N3))),(i21(_n4)+1),i2
1(_n4)),_N3))),1,0)
x21((_n4+1)) = d1array12(Dest,i21(_n4),_N3)
i21(0) = 0
y21(0) = y12(_N3)
RET21(0) = 0
break_1_flag21(0) = 0
x21(0) = x12(_N3)
((i21(_N4)>=__VERIFIER_nondet_int) or (break_1_flag21(_N4)!=0))
(_n4<_N4) -> ((i21(_n4)<__VERIFIER_nondet_int) and (break_1_flag21(_n4)==0))
d1array23(_x1,_x2,0) = d1array12(_x1,_x2,_N3)
(_N5>=(-(0)+__VERIFIER_nondet_int))
(_n5<_N5) -> ((_n5+0)<__VERIFIER_nondet_int)

4. Assumption :
((0<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=19))
((0<=__VERIFIER_nondet_int) and (__VERIFIER_nondet_int<=4))

5. Assertion :
(d1array23(distance,(_n5+0),_n5)>=0)
Output for __VERIFIER_assert:
Output in prefix notation:
1. Frame axioms:
(= (cond1 cond) cond)

2. Output equations:
(= (_1_FAILED1 cond) (ite (<= cond 0) 1 0))
(= INFINITY1 899)
(= (__VERIFIER_assert cond) 0)

3. Other axioms:

Output in normal notation:
1. Frame axioms:
cond1(cond) = cond

2. Output equations:
_1_FAILED1(cond) = ite((cond<=0),1,0)
INFINITY1 = 899
__VERIFIER_assert(cond) = 0

3. Other axioms:

4. Assumption :

5. Assertion :

----Proving Process----


Function Name--main

Assertion To Prove:ForAll([_n5],d1array23(distance, _n5, _n5) >= 0)
Failed to Prove

Function Name--__VERIFIER_assert
No Assertion to Prove
0